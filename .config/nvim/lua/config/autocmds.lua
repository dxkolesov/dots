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
  group = vim.api.nvim_create_augroup("ShowCursorLine", { clear = true }),
  callback = function(event)
    local buftype = vim.bo[event.buf].buftype
    local filetype = vim.bo[event.buf].filetype
    if buftype ~= "nofile" and filetype ~= "NvimTree" then
      vim.wo.cursorline = true
    end
  end,
})
autocmd({ "InsertEnter", "WinLeave" }, {
  group = vim.api.nvim_create_augroup("HideCursorLine", { clear = true }),
  callback = function(event)
    local buftype = vim.bo[event.buf].buftype
    local filetype = vim.bo[event.buf].filetype
    if buftype ~= "nofile" and filetype ~= "NvimTree" then
      vim.wo.cursorline = false
    end
  end,
})
