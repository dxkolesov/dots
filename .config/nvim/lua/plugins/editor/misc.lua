return {
  -- mason border
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "single",
      },
    },
  },

  -- lsp border
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = function(_, opts)
      -- add border
      require("lspconfig.ui.windows").default_options.border = "single"

      -- hover border
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      for _, key in ipairs(keys) do
        if key[1] == "K" then
          key[2] = function()
            return vim.lsp.buf.hover({ border = "single" })
          end
          break
        end
      end

      opts.keys = keys
    end,
  },

  -- change icons
  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        diagnostics = {
          Error = "E",
          Warn = "W",
          Hint = "H",
          Info = "I",
        },
      },
    },
  },
}
