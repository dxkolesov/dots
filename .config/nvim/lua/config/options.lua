-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.guicursor = ""
opt.list = false
opt.showmode = true
opt.ruler = true
opt.statusline = "%<%f %h%m%r%=%-14.(%l:%L, %c%V%) %P"
opt.spelllang = "en,ru"

vim.g.deprecation_warnings = true
