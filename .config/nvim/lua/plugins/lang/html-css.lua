return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "scss",
        "styled",
      },
    },
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "emmet-language-server",
        "htmlhint",

        "css-lsp",
        "css-variables-language-server",
        "cssmodules-language-server",
        "some-sass-language-server",
        "stylelint-lsp",
      },
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

  -- px to rem
  {
    "saghen/blink.cmp",
    optional = true,
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
}
