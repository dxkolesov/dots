return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- fidget
      {
        "j-hui/fidget.nvim",
        opts = {},
      },

      -- tsc
      {
        "dmmulroy/tsc.nvim",
        cmd = "TSC",
        opts = {},
      },
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- html
        html = {},

        -- emmet
        emmet_language_server = {},

        -- css
        cssls = {},

        -- shaders
        glsl_analyzer = {},
      },

      inlay_hints = {
        enabled = false,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = function(_, opts)
      ---@type lspconfig.options
      -- add border
      require("lspconfig.ui.windows").default_options.border = "single"

      -- border for floating windows
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
      vim.diagnostic.config({ float = { border = "single" } })

      -- disable <c-k>
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { mode = "i", "<C-k>", false }
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
