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
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
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
        sources = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then
            return { "buffer" }
          end
          -- Commands
          if type == ":" or type == "@" then
            return { "cmdline" }
          end
          return {}
        end,
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

  -- add nvim_px_to_rem
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
}
