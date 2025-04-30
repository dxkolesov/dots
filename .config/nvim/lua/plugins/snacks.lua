return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
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
  },
}
