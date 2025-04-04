return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "scss",
      },
    },
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        -- "dprint",
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

      -- formatters = {
      --   dprint = {
      --     condition = function(_, ctx)
      --       return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
      --     end,
      --   },
      -- },
    },
  },

  -- tsc
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    opts = {},
  },

  -- web-tools
  {
    "ray-x/web-tools.nvim",
    cmd = {
      "BrowserSync",
      "BrowserOpen",
      "BrowserPreview",
      "BrowserRestart",
      "BrowserStop",
      "TagRename",
      "HurlRun",
      "Npm",
      "Yarn",
      "Pnpm",
      "Npx",
      "Node",
      "JobStop",
    },
    opts = {},
  },

  -- tailwind values
  {
    "MaximilianLloyd/tw-values.nvim",
    keys = {
      { "<Leader>cv", "<CMD>TWValues<CR>", desc = "Tailwind CSS values" },
    },
    opts = {
      border = "single",
    },
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
}
