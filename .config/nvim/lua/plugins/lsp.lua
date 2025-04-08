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
              border = "single",
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
          border = "single",
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
