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
        "emmet-language-server",
        "stylelint-lsp",
        "css-variables-language-server",
        "cssmodules-language-server",
        "some-sass-language-server",

        "prettierd",
        -- "dprint",

        "htmlhint",
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

  -- lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        html = { "htmlhint" },
      },
      linters = {
        htmlhint = {
          condition = function(ctx)
            local root = LazyVim.root.get({ normalize = true })
            if root ~= vim.uv.cwd() then
              return false
            end
            return vim.fs.find({ ".htmlhintrc" }, { path = root, upward = true })[1]
          end,
        },
      },
    },
  },

  -- px to rem
  {
    "saghen/blink.cmp",
    dependencies = {
      { "jsongerber/nvim-px-to-rem", config = true },
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}

      opts.sources.default = opts.sources.default or {}
      table.insert(opts.sources.default, "nvim-px-to-rem")

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers["nvim-px-to-rem"] = {
        module = "nvim-px-to-rem.integrations.blink",
        name = "nvim-px-to-rem",
      }
      return opts
    end,
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

  -- colorizer
  {
    "brenoprata10/nvim-highlight-colors",
    event = "LazyFile",
    cmd = "HighlightColors",
    opts = {
      enable_tailwind = true,
      enabled_named_colors = false,
    },
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
