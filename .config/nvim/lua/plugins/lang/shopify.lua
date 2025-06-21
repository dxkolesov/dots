return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "liquid",
      },
    },
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "shopify-cli",
        "erb-lint",
      },
    },
  },

  -- lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        liquid = { "erb_lint" },
      },
      -- linters = {
      --   erb_lint = {},
      -- },
    },
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        shopify_theme_ls = {
          root_dir = function()
            return vim.loop.cwd()
          end,
        },
      },
    },
  },

  -- formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        liquid = {
          "prettierd",
          "prettier",
          stop_after_first = true,
        },
      },
    },
  },
}
