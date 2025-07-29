return {
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
        accept_word = "<Nop>",
      },

      ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
    },
  },
}
