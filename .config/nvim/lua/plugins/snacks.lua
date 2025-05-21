return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- open quicker qickfix list
      local actions = require("snacks.picker.actions")
      local setqflist = function(items, opts)
        local qf = {} ---@type vim.quickfix.entry[]
        for _, item in ipairs(items) do
          qf[#qf + 1] = {
            filename = require("snacks").picker.util.path(item),
            bufnr = item.buf,
            lnum = item.pos and item.pos[1] or 1,
            col = item.pos and item.pos[2] + 1 or 1,
            end_lnum = item.end_pos and item.end_pos[1] or nil,
            end_col = item.end_pos and item.end_pos[2] + 1 or nil,
            text = item.line or item.comment or item.label or item.name or item.detail or item.text,
            pattern = item.search,
            valid = true,
          }
        end
        if opts and opts.win then
          vim.fn.setloclist(opts.win, qf)
          require("quicker").open({
            focus = true,
            loclist = true,
          })
        else
          vim.fn.setqflist(qf)
          require("quicker").open({
            focus = true,
          })
        end
      end

      actions.qflist = function(picker)
        picker:close()
        local sel = picker:selected()
        local items = #sel > 0 and sel or picker:items()
        setqflist(items)
      end

      actions.qflist_all = function(picker)
        picker:close()
        setqflist(picker:items())
      end

      -- input
      opts.input = { enabled = false }

      -- scroll
      opts.scroll = { enabled = false }

      -- indent
      opts.indent = { animate = { enabled = false } }

      -- picker
      opts.picker = {
        icons = {
          diagnostics = {
            Error = "E",
            Warn = "W",
            Hint = "H",
            Info = "I",
          },
        },

        sources = {
          explorer = {
            layout = {
              -- explorer width
              layout = {
                width = 0.2,
              },
              -- hide input
              hidden = { "input" },
            },
          },
        },
      }

      -- dashboard header
      opts.dashboard.preset.header = {
        vim.fn.fnamemodify(vim.fn.getcwd(), ":~"),
      }

      -- highlights
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      vim.api.nvim_set_hl(0, "SnacksPickerTree", { link = "SnacksIndent" })
    end,

    -- open explorer on start
    init = function()
      local dashboard_group = vim.api.nvim_create_augroup("SnacksDashboardEvents", { clear = true })

      local function should_skip_buffer()
        return vim.bo.filetype:match("snacks") or vim.bo.buftype == "nofile"
      end

      vim.api.nvim_create_autocmd("BufLeave", {
        pattern = "*",
        group = dashboard_group,
        callback = function()
          if vim.bo.filetype ~= "snacks_dashboard" then
            return
          end

          vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*",
            group = dashboard_group,
            callback = function()
              if should_skip_buffer() then
                return
              end

              Snacks.explorer({
                cwd = LazyVim.root(),
                focus = false,
              })

              vim.api.nvim_clear_autocmds({ group = dashboard_group })
            end,
          })
        end,
      })
    end,

    keys = {
      -- dont focus explorer on open
      {
        "<leader>fe",
        function()
          Snacks.explorer({ cwd = LazyVim.root(), focus = false })
        end,
        desc = "Explorer Snacks (root dir)",
      },
      {
        "<leader>fE",
        function()
          Snacks.explorer({ focus = false })
        end,
        desc = "Explorer Snacks (cwd)",
      },
    },
  },
}
