return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
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
