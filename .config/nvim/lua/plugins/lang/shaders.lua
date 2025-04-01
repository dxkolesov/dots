return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "glsl",
      })
    end,
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- servers
        "glsl_analyzer",

        -- formatters
        "clang-format",
      })
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        glsl_analyzer = {},
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
