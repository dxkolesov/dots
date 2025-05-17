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
          ["<CR>"] = { "accept_and_enter", "fallback" },
          ["<Right>"] = { "fallback" },
          ["<Left>"] = { "fallback" },
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

  -- cmdline wilder
  -- {
  --   "gelguy/wilder.nvim",
  --   keys = { ":", "/", "?" },
  --   config = function()
  --     local wilder = require("wilder")
  --
  --     wilder.setup({ modes = { ":", "/", "?" }, next_key = "<C-n>", previous_key = "<C-p>" })
  --
  --     wilder.set_option(
  --       "renderer",
  --       wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
  --         highlights = {
  --           border = "FoldColumn",
  --           default = "Normal",
  --         },
  --         pumblend = 0,
  --       }))
  --     )
  --
  --     -- ignore case
  --     wilder.set_option(
  --       "pipeline",
  --       wilder.branch(wilder.cmdline_pipeline({
  --         fuzzy = 1,
  --       }))
  --     )
  --   end,
  -- },

  -- colorizer
  {
    "brenoprata10/nvim-highlight-colors",
    event = "LazyFile",
    cmd = "HighlightColors",
    opts = {
      enable_tailwind = true,
      enabled_named_colors = false,
      virtual_symbol = "󱓻",
    },
  },

  -- blink.cmp integration
  {
    "Saghen/blink.cmp",
    optional = true,
    opts = {
      completion = {
        menu = {
          draw = {
            components = {
              -- customize the drawing of kind icons
              kind_icon = {
                text = function(ctx)
                  -- default kind icon
                  local icon = ctx.kind_icon
                  -- if LSP source, check for color derived from documentation
                  if ctx.item.source_name == "LSP" then
                    local color_item =
                      require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                    if color_item and color_item.abbr ~= "" then
                      icon = color_item.abbr
                    end
                  end
                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  -- default highlight group
                  local highlight = "BlinkCmpKind" .. ctx.kind
                  -- if LSP source, check for color derived from documentation
                  if ctx.item.source_name == "LSP" then
                    local color_item =
                      require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                    if color_item and color_item.abbr_hl_group then
                      highlight = color_item.abbr_hl_group
                    end
                  end
                  return highlight
                end,
              },
            },
          },
        },
      },
    },
  },

  -- comment box
  {
    "LudoPinelli/comment-box.nvim",
    keys = {
      { "<leader>C", "", desc = "+commentbox", mode = { "n", "v" } },
      {
        "<leader>Cb",
        "<cmd>CBccbox<cr>",
        mode = { "n", "v" },
        desc = "Box Title",
      },
      {
        "<leader>Ct",
        "<cmd>CBllline<cr>",
        mode = { "n", "v" },
        desc = "Titled Line",
      },
      {
        "<leader>Cl",
        "<cmd>CBlline<cr>",
        mode = { "n", "v" },
        desc = "Simple Line",
      },
      {
        "<leader>Cm",
        "<cmd>CBllbox14<cr>",
        mode = { "n", "v" },
        desc = "Marked",
      },
      {
        "<leader>Cd",
        "<cmd>CBd<cr>",
        mode = { "n", "v" },
        desc = "Remove a box",
      },
    },
  },
}
