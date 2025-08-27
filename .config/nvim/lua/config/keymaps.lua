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

-- ai agent path
local function get_ai_path()
  local full_path = vim.fn.expand("%:p")
  local cwd = vim.fn.getcwd()
  return full_path:gsub("^" .. vim.pesc(cwd) .. "/", "@")
end

local function copy_ai_path(path)
  vim.fn.setreg("+", path .. " ")
  vim.notify("Copied AI agent path: " .. path)
end

set("n", "<leader>a", "", { desc = "+ai", silent = true })
set("v", "<leader>a", "", { desc = "+ai", silent = true })

set("n", "<leader>as", function()
  local ai_path = get_ai_path()
  copy_ai_path(ai_path)
end, { desc = "Copy path for AI terminal agents" })

set("v", "<leader>as", function()
  local ai_path = get_ai_path()
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  local path_with_lines = ai_path .. " L" .. start_line .. "-" .. end_line

  copy_ai_path(path_with_lines .. " ")

  vim.defer_fn(function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  end, 10)
end, { desc = "Copy path with line numbers for AI terminal agents" })
