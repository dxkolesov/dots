return {
  -- mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
      },
    },
  },

  -- formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = {
          "prettierd",
          "prettier",
          stop_after_first = true,
        },
      },
    },
  },
}
