return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "ai", mode = { "n", "v" } },
      },
    },
  },

  -- supermaven
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    cmd = {
      "SupermavenUseFree",
      "SupermavenUsePro",
    },
    opts = {
      keymaps = {
        accept_suggestion = "<C-y>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
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

  -- neocodeium
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
  --       "<C-y>",
  --       function()
  --         require("neocodeium").accept()
  --       end,
  --       mode = "i",
  --     },
  --     {
  --       "<M-]>",
  --       function()
  --         require("neocodeium").cycle_or_complete()
  --       end,
  --       mode = "i",
  --     },
  --     {
  --       "<M-[>",
  --       function()
  --         require("neocodeium").cycle_or_complete(-1)
  --       end,
  --       mode = "i",
  --     },
  --     {
  --       "<C-]>",
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

  -- codeium
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "InsertEnter",
  --   config = function()
  --     vim.keymap.set("i", "<C-y>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<M-]>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<M-[>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<C-]>", function()
  --       return vim.fn["codeium#Clear"]()
  --     end, { expr = true, silent = true })
  --   end,
  -- },
}
