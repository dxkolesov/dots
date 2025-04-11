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

        -- TODO: remove after https://github.com/LazyVim/LazyVim/pull/5620 is in stable
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

  -- text-case
  {
    "johmsalas/text-case.nvim",
    opts = {},
    cmd = "Subs",
  },

  -- comment box
  {
    "LudoPinelli/comment-box.nvim",
    keys = {
      { "<leader>C", "", desc = "+comment-box", mode = { "n", "v" } },
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
