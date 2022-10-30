-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Packer
vim.keymap.set("n", "<leader><leader>s", function() vim.cmd [[PackerSync]] end)

-- nvim-tree
vim.keymap.set("n", "<C-n>", function() vim.cmd [[NvimTreeToggle]] end)
vim.keymap.set("n", "<C-f>", function() vim.cmd [[NvimTreeFindFile]] end)

-- LSP
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Noice
vim.keymap.set("n", "<leader>nh", function() require("noice").cmd "history" end)
vim.keymap.set("n", "<leader>nl", function() require("noice").cmd "last" end)
vim.keymap.set("n", "<leader>ne", function() require("noice").cmd "errors" end)
vim.keymap.set("n", "<leader>nt", function() require("noice").cmd "telescope" end)

-- Misc
vim.keymap.set({ "n", "v" }, "<leader>p", [["*p]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]])
vim.keymap.set("n", "<leader><leader>l", function() vim.cmd [[luafile %]] end)
