return {
  {
    "Saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },

        menu = {
          border = "single",
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", gap = 1 },
              { "kind", gap = 1 },
            },
          },
        },
        documentation = {
          auto_show = true,
          window = {
            border = "single",
          },
        },
        ghost_text = {
          enabled = false,
        },
      },

      signature = {
        enabled = true,
        window = {
          border = "single",
        },
      },

      cmdline = {
        enabled = true,
        completion = {
          menu = { auto_show = true },
          list = {
            selection = { preselect = false, auto_insert = true },
          },
        },
        keymap = {
          preset = "none",
          ["<CR>"] = { "accept_and_enter", "fallback" },
          ["<C-y>"] = { "accept_and_enter", "fallback" },

          ["<Right>"] = { "fallback" },
          ["<Left>"] = { "fallback" },

          ["<C-n>"] = { "select_next", "fallback" },
          ["<C-p>"] = { "select_prev", "fallback" },

          ["<C-space>"] = { "show", "fallback" },
          ["<C-e>"] = { "hide", "fallback" },
        },
      },

      keymap = {
        ["<C-y>"] = { "accept", "fallback" },

        -- hide on ai completions cycle
        ["<M-]>"] = { "hide", "fallback" },
        ["<M-[>"] = { "hide", "fallback" },
      },
    },
  },

  -- blink-cmp-git
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = {
      { "Kaiser-Yang/blink-cmp-git" },
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}

      opts.sources.default = opts.sources.default or {}
      table.insert(opts.sources.default, "git")

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers["git"] = {
        module = "blink-cmp-git",
        name = "Git",
      }
      return opts
    end,
  },

  -- blink-cmp-npm
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = {
      { "alexandre-abrioux/blink-cmp-npm.nvim" },
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}

      opts.sources.default = opts.sources.default or {}
      table.insert(opts.sources.default, "npm")

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers["npm"] = {
        module = "blink-cmp-npm",
        name = "npm",
        async = true,
        -- the options below are optional
        ---@module "blink-cmp-npm"
        ---@type blink-cmp-npm.Options
        opts = {
          ignore = {},
          only_semantic_versions = true,
          only_latest_version = false,
        },
      }
      return opts
    end,
  },

  -- blink-cmp-env
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = {
      { "bydlw98/blink-cmp-env" },
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}

      opts.sources.default = opts.sources.default or {}
      table.insert(opts.sources.default, "env")

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers["env"] = {
        module = "blink-cmp-env",
        name = "Env",
        -- the options below are optional
        ---@module "blink-cmp-env"
        ---@type blink-cmp-env.Options
        opts = {
          item_kind = require("blink.cmp.types").CompletionItemKind.Variable,
          show_braces = false,
          show_documentation_window = true,
        },
      }
      return opts
    end,
  },
}
