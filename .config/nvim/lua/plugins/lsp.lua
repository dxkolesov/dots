return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- fidget
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
    },
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = false,
      },
    },
  },

  -- import languages configs
  { import = "plugins.lang" },
}
