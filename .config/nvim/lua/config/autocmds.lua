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

-- auto-center after jumping 5+ lines
local last_lines = {}

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    if vim.bo.buftype ~= "" then
      return
    end

    local buf = vim.api.nvim_get_current_buf()
    local line = vim.api.nvim_win_get_cursor(0)[1]
    local last = last_lines[buf]

    if last and math.abs(line - last) >= 5 then
      vim.cmd("normal! zz")
    end

    last_lines[buf] = line
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(event)
    last_lines[event.buf] = nil
  end,
})
