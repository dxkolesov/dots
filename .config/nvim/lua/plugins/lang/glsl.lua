return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "glsl",
      },
    },
  },

  -- mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "glsl_analyzer",
        "clang-format",
      },
    },
  },

  -- formatter
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["glsl"] = { "clang-format" },
      },
    },
  },
}
