return {

  -- which-key
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "ai", mode = { "n", "v" } },
      },
    },
  },

  -- autocomplete
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    cmd = {
      "SupermavenUseFree",
      "SupermavenUsePro",
    },
    opts = {
      keymaps = {
        accept_suggestion = "<Tab>",
        accept_word = "<A-a>",
        clear_suggestion = "<A-e>",
      },
      ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
    },

    -- disable on startup
    config = function(_, opts)
      require("supermaven-nvim").setup(opts)
      local api = require("supermaven-nvim.api")
      api.stop()
    end,

    keys = {
      {
        "<leader>a,",
        "<cmd>SupermavenToggle<cr>",
        desc = "Toggle Supermaven",
      },
    },
  },

  -- {
  --   "monkoose/neocodeium",
  --   cmd = "NeoCodeium",
  --   event = "InsertEnter",
  --   opts = {
  --     show_label = false,
  --     silent = true,
  --   },
  --   keys = {
  --     {
  --       "<Tab>",
  --       function()
  --         require("neocodeium").accept()
  --       end,
  --       mode = "i",
  --     },
  --     {
  --       "<A-]>",
  --       function()
  --         require("neocodeium").cycle_or_complete()
  --       end,
  --       mode = "i",
  --     },
  --     {
  --       "<A-[>",
  --       function()
  --         require("neocodeium").cycle_or_complete(-1)
  --       end,
  --       mode = "i",
  --     },
  --     {
  --       "<A-e>",
  --       function()
  --         require("neocodeium").clear()
  --       end,
  --       mode = "i",
  --     },
  --     {
  --       "<leader>a,",
  --       "<cmd>NeoCodeium toggle<cr>",
  --       mode = "n",
  --       desc = "Toggle NeoCodeium",
  --     },
  --   },
  -- },

  -- {
  --   "Exafunction/codeium.vim",
  --   event = "InsertEnter",
  --   config = function()
  --     vim.keymap.set("i", "<Tab>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<A-]>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<A-[>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<A-e>", function()
  --       return vim.fn["codeium#Clear"]()
  --     end, { expr = true, silent = true })
  --   end,
  -- },
}
