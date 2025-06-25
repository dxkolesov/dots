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
            open_cmd_mods = { split = "belowright" },
          })
        else
          vim.fn.setqflist(qf)
          require("quicker").open({
            focus = true,
            open_cmd_mods = { split = "belowright" },
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
              -- layout = {
              --   width = 0.2,
              -- },
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

    init = function()
      local function should_skip_buffer(buf)
        buf = buf or vim.api.nvim_get_current_buf()

        if not vim.api.nvim_buf_is_valid(buf) then
          return true
        end

        local bufname = vim.api.nvim_buf_get_name(buf)
        if bufname == vim.fn.expand("~/TODO.md") then
          return true
        end

        local bo = vim.bo[buf]

        if bo.buftype ~= "" or bo.buftype == "terminal" then
          return true
        end

        if bo.filetype == "lazy" or bo.filetype:find("snacks", 1, true) then
          return true
        end

        return false
      end

      local explorer_dashboard_group = vim.api.nvim_create_augroup("SnacksDashboardEvents", { clear = true })

      -- open explorer and claude code when leaving the dashboard
      vim.api.nvim_create_autocmd("BufLeave", {
        pattern = "*",
        group = explorer_dashboard_group,
        callback = function(event)
          if vim.bo[event.buf].filetype ~= "snacks_dashboard" then
            return
          end

          vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*",
            group = explorer_dashboard_group,
            once = true,
            callback = function()
              if should_skip_buffer() then
                return
              end

              local ok, snacks = pcall(require, "snacks")
              if not ok then
                return
              end

              vim.schedule(function()
                -- open snacks explorer
                snacks.explorer({
                  cwd = LazyVim.root(),
                  focus = false,
                })
                -- open claude code
                local current_win = vim.api.nvim_get_current_win()
                vim.cmd("ClaudeCode")
                vim.api.nvim_set_current_win(current_win)
                vim.cmd("stopinsert")
              end)

              -- cleanup
              vim.api.nvim_clear_autocmds({ group = explorer_dashboard_group })
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
      -- todo list
      {
        "<leader>t",
        function()
          Snacks.scratch({ icon = " ", name = "Todo", ft = "markdown", file = "~/TODO.md" })
        end,
        desc = "Todo List",
      },

      -- delete other buffers except terminal
      {
        "<leader>bo",
        function()
          Snacks.bufdelete.delete({
            filter = function(buf)
              return buf ~= vim.api.nvim_get_current_buf() and vim.bo[buf].buftype ~= "terminal"
            end,
          })
        end,
        desc = "Delete Other Buffers",
      },
    },
  },
}
