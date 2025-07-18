-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set

-- text editing
set("n", "<C-c>", "ciw", { desc = "Change word", silent = true })
set("n", "J", "mzJ`z", { desc = "Join lines keeping cursor position", silent = true })
set("n", "=ap", "ma=ap'a", { desc = "Format paragraph and keep position", silent = true })

-- navigation and scrolling
set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center", silent = true })
set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center", silent = true })
set("n", "n", "nzzzv", { desc = "Next search result centered", silent = true })
set("n", "N", "Nzzzv", { desc = "Previous search result centered", silent = true })
set("n", "G", "Gzz", { desc = "Go to bottom and center", silent = true })

set("n", ";", ":", { desc = "CMD enter command mode" })
set("i", "jk", "<ESC>", { desc = "escape insert mode" })

set("n", "<leader>Y", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  vim.notify("Copied filepath: " .. vim.fn.expand("%:p"))
end, { desc = "Copy current file path" })
