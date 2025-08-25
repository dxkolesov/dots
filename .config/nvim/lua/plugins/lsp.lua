return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = false,
      },
      diagnostics = {
        float = {
          source = true,
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
