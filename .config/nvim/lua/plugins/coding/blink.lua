return {
  {
    "Saghen/blink.cmp",
    optional = true,
    opts = {
      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },

        menu = {
          border = "rounded",
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
            border = "rounded",
          },
        },
        ghost_text = {
          enabled = false,
        },
      },

      signature = {
        enabled = true,
        window = {
          border = "rounded",
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

  -- git source
  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   dependencies = { "Kaiser-Yang/blink-cmp-git" },
  --   opts = {
  --     sources = {
  --       default = { "git" },
  --       providers = {
  --         git = {
  --           module = "blink-cmp-git",
  --           name = "Git",
  --         },
  --       },
  --     },
  --   },
  -- },

  -- packages.json source
  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   dependencies = { "alexandre-abrioux/blink-cmp-npm.nvim" },
  --   opts = {
  --     sources = {
  --       default = {
  --         "npm",
  --       },
  --       providers = {
  --         npm = {
  --           name = "npm",
  --           module = "blink-cmp-npm",
  --           async = true,
  --           score_offset = 100,
  --           opts = {
  --             ignore = {},
  --             only_semantic_versions = true,
  --             only_latest_version = false,
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },

  -- environment variables source
  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   dependencies = { "bydlw98/blink-cmp-env" },
  --   opts = {
  --     sources = {
  --       default = { "env" },
  --       providers = {
  --         env = {
  --           name = "Env",
  --           module = "blink-cmp-env",
  --           opts = {
  --             item_kind = require("blink.cmp.types").CompletionItemKind.Variable,
  --             show_braces = false,
  --             show_documentation_window = true,
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
}
