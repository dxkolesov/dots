return {
  {
    "obsidian-nvim/obsidian.nvim",
    event = { "BufReadPre  */obsidian-vault/*.md" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "home",
          path = vim.env.HOME .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian-vault",
        },
      },

      ui = { enable = false },

      legacy_commands = false,

      daily_notes = {
        folder = "daily",
      },

      -- if blink.cmp
      completion = {
        nvim_cmp = false,
        blink = true,
      },
    },
  },
}
