vim.o.virtualedit = "block"
vim.o.wrap = true
vim.o.textwidth = 88

-- Undotree
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.o.undofile = true

-- Use treesitter for folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- What to restore when persisted.nvim runs
vim.o.sessionoptions = "buffers,curdir,folds,globals,help,skiprtp,tabpages,winpos,winsize"
