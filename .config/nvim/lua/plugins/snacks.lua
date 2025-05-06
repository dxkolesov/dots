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

    -- open explorer on start
    init = function()
      vim.api.nvim_create_autocmd("BufLeave", {
        pattern = "*",
        callback = function()
          if vim.bo.filetype ~= "snacks_dashboard" then
            return
          end

          vim.schedule(function()
            local ft = vim.bo.filetype
            if not ft:find("snacks") and ft ~= "lazy" then
              Snacks.explorer({ cwd = LazyVim.root(), focus = false })
            end
          end)
        end,
      })
    end,

    keys = {
      -- smart open
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Open",
      },

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
