return {
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
        accept_suggestion = "<M-l>",
        clear_suggestion = "<C-]>",
      },
      ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
    },
  },

  -- neocodeium
  -- {
  --   "monkoose/neocodeium",
  --   event = "InsertEnter",
  --   opts = {
  --     silent = true,
  --     show_label = false,
  --   },
  --   keys = {
  --     {
  --       "<M-l>",
  --       function()
  --         require("neocodeium").accept()
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = "i",
  --       desc = "Neocodeium Accept",
  --     },
  --     {
  --       "<M-]>",
  --       function()
  --         require("neocodeium").cycle_or_complete()
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = "i",
  --       desc = "Neocodeium Next Completion",
  --     },
  --     {
  --       "<M-[>",
  --       function()
  --         require("neocodeium").cycle_or_complete(-1)
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = "i",
  --       desc = "Neocodeium Previous Completion",
  --     },
  --     {
  --       "<C-]>",
  --       function()
  --         require("neocodeium").clear()
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = "i",
  --       desc = "Neocodeium Clear",
  --     },
  --   },
  -- },

  -- codeium
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "InsertEnter",
  --   keys = {
  --     {
  --       "<M-l>",
  --       function()
  --         return vim.fn["codeium#Accept"]()
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = "i",
  --       desc = "Codeium Accept",
  --     },
  --     {
  --       "<M-]>",
  --       function()
  --         return vim.fn["codeium#CycleCompletions"](1)
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = "i",
  --       desc = "Codeium Next Completion",
  --     },
  --     {
  --       "<M-[>",
  --       function()
  --         return vim.fn["codeium#CycleCompletions"](-1)
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = "i",
  --       desc = "Codeium Previous Completion",
  --     },
  --     {
  --       "<C-]>",
  --       function()
  --         return vim.fn["codeium#Clear"]()
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = "i",
  --       desc = "Codeium Clear",
  --     },
  --   },
  -- },

  -- copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   build = ":Copilot auth",
  --   event = "InsertEnter",
  --   opts = {
  --     filetypes = { ["*"] = true },
  --     suggestion = {
  --       auto_trigger = true,
  --       hide_during_completion = false,
  --       keymap = {
  --         accept = "<M-l>",
  --         accept_word = false,
  --         accept_line = false,
  --         next = "<M-]>",
  --         prev = "<M-[>",
  --         dismiss = "<C-]>",
  --       },
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>a,",
  --       "<cmd>Copilot toggle<cr>",
  --       desc = "Toggle Copilot",
  --     },
  --   },
  -- },
}
