-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- local map = vim.keymap.set
-- local create_cmd = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd

-- dont add comments on new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set formatoptions-=cro",
})

autocmd("BufEnter", {
  pattern = "*",
  command = "setlocal formatoptions-=cro",
})

-- show cursor line only in active window
autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
})
autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})

-- open the explorer after loading session
autocmd({ "User" }, {
  pattern = "PersistenceLoadPost",
  callback = function()
    Snacks.explorer({ cwd = LazyVim.root(), focus = false })
  end,
})
