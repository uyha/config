local cmd = vim.cmd

cmd [[set foldmethod=expr]]
cmd [[set foldexpr=nvim_treesitter#foldexpr()]]

vim.opt.number = true
vim.opt.relativenumber = true
