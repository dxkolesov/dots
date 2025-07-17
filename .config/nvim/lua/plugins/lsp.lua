return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- fidget
      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            window = {
              border = "rounded",
              normal_hl = "NormalFloat",
              winblend = 1,
            },
          },
        },
      },
    },
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = false,
      },
      diagnostics = {
        float = {
          source = true,
          border = "rounded",
        },
        virtual_text = {
          source = true,
        },
      },
    },
  },

  -- import languages configs
  { import = "plugins.lang" },
}
