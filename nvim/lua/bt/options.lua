vim.o.termguicolors = true
vim.o.splitright = true --Vertical split on the right
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2

-- Use treesitter for folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Autocomplete
vim.o.completeopt = "menu,menuone,noselect"

vim.g.mapleader = " "

