return {
  -- mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "shfmt",
      },
    },
  },

  -- formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt", "shellcheck" },
        zsh = { "shfmt", "shellcheck" },
      },
    },
  },

  -- lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" },
        zsh = { "shellcheck" },
      },
    },
  },
}
