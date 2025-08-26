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
          -- explorer
          explorer = {
            layout = {
              layout = {
                width = 0.2,
              },
              hidden = { "input" },
            },
          },
        },
      }

      -- fix scratch z-index
      opts.styles = {
        scratch = {
          zindex = 33,
        },
      }

      -- highlights
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      vim.api.nvim_set_hl(0, "SnacksPickerTree", { link = "SnacksIndent" })
    end,

    keys = {
      -- dont focus explorer on open
      {
        "<leader>e",
        function()
          Snacks.explorer({ cwd = LazyVim.root(), focus = false })
        end,
        desc = "Explorer Snacks (root dir)",
      },
      {
        "<leader>E",
        function()
          Snacks.explorer({ focus = false })
        end,
        desc = "Explorer Snacks (cwd)",
      },
      -- todo list
      {
        "<leader>t",
        function()
          Snacks.scratch({
            icon = " ",
            name = "Todo",
            ft = "markdown",
            file = os.getenv("HOME") .. "/Documents/dev/TODO.md",
          })
        end,
        desc = "Todo List",
      },
    },
  },
}
