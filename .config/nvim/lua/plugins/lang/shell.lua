return {
  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- formatters
        "shfmt",
      })
    end,
  },

  -- formatter
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        sh = { "shfmt", "shellcheck" },
        zsh = { "shfmt", "shellcheck" },
        bash = { "shfmt", "shellcheck" },
      },
    },
  },

  -- lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" },
      },
    },
  },
}
