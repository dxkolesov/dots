return {
  -- vague
  {
    "vague2k/vague.nvim",
    opts = {
      transparent = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = "vague"
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          -- statusline
          vim.api.nvim_set_hl(0, "StatusLine", { bg = "#333333" })

          -- snacks indent
          vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#333333" })

          -- flash label
          vim.api.nvim_set_hl(0, "FlashLabel", { link = "TodoBgHack" })

          -- blink cmp menu
          vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "Normal" })

          -- remove fg color from PmenuSel for tailwind colors
          local pmenu_hl = vim.api.nvim_get_hl(0, { name = "PmenuSel" })
          pmenu_hl.fg = nil
          vim.api.nvim_set_hl(0, "PmenuSel", pmenu_hl)
        end,
      })
    end,
  },
}
