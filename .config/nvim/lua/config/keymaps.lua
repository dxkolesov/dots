-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set

-- text editing
set("n", "<C-c>", "ciw", { desc = "Change word", silent = true })
set("n", "J", "mzJ`z", { desc = "Join lines keeping cursor position", silent = true })
set("n", "=ap", "ma=ap'a", { desc = "Format paragraph and keep position", silent = true })

set("n", ";", ":", { desc = "CMD enter command mode" })
set("i", "jk", "<ESC>", { desc = "escape insert mode" })
