return {
  -- mason
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "dprint",
  --     },
  --   },
  -- },

  -- formatter
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       typescript = {
  --         "dprint",
  --         "prettier",
  --         stop_after_first = true,
  --       },
  --     },
  --
  --     formatters = {
  --       dprint = {
  --         condition = function(_, ctx)
  --           return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
  --         end,
  --       },
  --     },
  --   },
  -- },

  -- tsc
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    opts = {},
  },

  -- template string
  {
    "axelvc/template-string.nvim",
    opts = {
      filetypes = {
        "html",
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "vue",
        "svelte",
        "python",
        "cs",
      }, -- filetypes where the plugin is active
      jsx_brackets = true, -- must add brackets to jsx attributes
      -- remove backticks when there are no template string
      remove_template_string = true,
      restore_quotes = {
        -- quotes used when "remove_template_string" option is enabled
        normal = [[']],
        jsx = [["]],
      },
    },
    ft = {
      "html",
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "vue",
      "svelte",
      "python",
      "cs",
    },
  },

  -- package info
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "BufRead package.json",
  },

  -- import cost
  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh npm",
    opts = {},
    ft = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
    },
  },
}
