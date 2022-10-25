vim.o.termguicolors = true
vim.o.splitright = true --Vertical split on the right
vim.o.number = true
vim.o.relativenumber = true

vim.g.mapleader = " "

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
