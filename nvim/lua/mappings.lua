-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>ll", function() vim.cmd [[luafile %]] end)

-- Packer
vim.keymap.set("n", "<leader>ps", function() vim.cmd [[PackerSync]] end)

-- nvim-tree
vim.keymap.set("n", "<C-n>", function() vim.cmd [[NvimTreeToggle]] end)
vim.keymap.set("n", "<C-f>", function() vim.cmd [[NvimTreeFindFile]] end)

-- LSP
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
