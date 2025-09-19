return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        auto_trigger = true,
      },
      filetypes = { ["*"] = true },
    },
  },

  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   event = "InsertEnter",
  --   cmd = {
  --     "SupermavenUseFree",
  --     "SupermavenUsePro",
  --   },
  --   opts = {
  --     keymaps = {
  --       accept_suggestion = "<M-l>",
  --       clear_suggestion = "<C-]>",
  --       accept_word = "<Nop>",
  --     },
  --
  --     ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
  --   },
  -- },
}
