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
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   event = "InsertEnter",
  --   cmd = {
  --     "SupermavenUseFree",
  --     "SupermavenUsePro",
  --   },
  --   opts = {
  --     keymaps = {
  --       accept_suggestion = "<C-y>",
  --       clear_suggestion = "<C-]>",
  --       accept_word = "<C-j>",
  --     },
  --     ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
  --   },
  --
  --   keys = {
  --     {
  --       "<leader>a,",
  --       "<cmd>SupermavenToggle<cr>",
  --       desc = "Toggle Supermaven",
  --     },
  --   },
  -- },

  -- codeium
  {
    "Exafunction/codeium.vim",
    cmd = {
      "Codeium",
      "CodeiumEnable",
      "CodeiumDisable",
      "CodeiumToggle",
      "CodeiumAuto",
      "CodeiumManual",
    },
    event = "BufEnter",
    keys = {
      {
        "<C-y>",
        function()
          return vim.fn["codeium#Accept"]()
        end,
        expr = true,
        silent = true,
        mode = "i",
        desc = "Codeium Accept",
      },
      {
        "<M-]>",
        function()
          return vim.fn["codeium#CycleCompletions"](1)
        end,
        expr = true,
        silent = true,
        mode = "i",
        desc = "Codeium Next Completion",
      },
      {
        "<M-[>",
        function()
          return vim.fn["codeium#CycleCompletions"](-1)
        end,
        expr = true,
        silent = true,
        mode = "i",
        desc = "Codeium Previous Completion",
      },
      {
        "<C-]>",
        function()
          return vim.fn["codeium#Clear"]()
        end,
        expr = true,
        silent = true,
        mode = "i",
        desc = "Codeium Clear",
      },
      {
        "<leader>a,",
        "<cmd>CodeiumToggle<cr>",
        desc = "Toggle Codeium",
      },
    },
  },
}
