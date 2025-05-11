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
      local group = vim.api.nvim_create_augroup("SnacksDashboardLeaveAutocmds", { clear = true })

      vim.api.nvim_create_autocmd("BufLeave", {
        pattern = "*",
        group = group,
        callback = function()
          if vim.bo.filetype ~= "snacks_dashboard" then
            return
          end

          vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*",
            group = group,
            once = true,
            callback = function()
              local ft = vim.bo.filetype
              if not ft:match("snacks") and ft ~= "lazy" then
                vim.defer_fn(function()
                  Snacks.explorer({ cwd = LazyVim.root(), focus = false })
                  vim.api.nvim_clear_autocmds({ group = group })
                end, 200)
              end
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
