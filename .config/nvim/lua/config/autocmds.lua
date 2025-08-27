-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- local map = vim.keymap.set
-- local create_cmd = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd

-- dont add comments on new lines
vim.opt.formatoptions:remove({ "c", "r", "o" })
autocmd("BufEnter", {
  pattern = "*",
  command = "setlocal formatoptions-=cro",
})
