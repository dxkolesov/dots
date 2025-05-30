return {
  {
    "obsidian-nvim/obsidian.nvim",
    event = { "BufReadPre  */obsidian-vault/*.md" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      ui = { enable = false },
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
      },

      dir = vim.env.HOME .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian-vault",

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
