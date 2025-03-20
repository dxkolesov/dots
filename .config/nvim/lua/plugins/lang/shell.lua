return {
  -- treesitter
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, {
  --       "bash",
  --     })
  --   end,
  -- },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- formatters
        "shfmt",
        -- linters
        -- "shellcheck",
      })
    end,
  },

  -- lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       bashls = {},
  --     },
  --   },
  -- },

  -- formatter
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["sh"] = { "shfmt" },
        ["zsh"] = { "shfmt" },
        ["bash"] = { "shfmt" },
      },
    },
  },

  -- lint
  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = {
  --     linters_by_ft = {
  --       sh = { "shellcheck" },
  --     },
  --   },
  -- },
}
