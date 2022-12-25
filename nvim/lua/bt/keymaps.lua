-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Window resize
vim.keymap.set({ "n", "i", "t" }, "<M-]>", "<cmd>vertical resize +5<CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<M-[>", "<cmd>vertical resize -5<CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<M-=>", "<cmd>resize +5<CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<M-->", "<cmd>resize -5<CR>", { silent = true })

-- Packer
vim.keymap.set("n", "<leader><leader>s", function()
  vim.cmd([[luafile ]] .. vim.fn.stdpath "config" .. [[/lua/bt/plugins/init.lua]])
  vim.cmd [[PackerSync]]
end, { desc = "Run PackerSync" })

-- nvim-tree
vim.keymap.set("n", "<C-n>", function() vim.cmd [[NvimTreeToggle]] end)
vim.keymap.set("n", "<C-f>", function() vim.cmd [[NvimTreeFindFile]] end)

-- LSP
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Go to the previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Go to the next diagnostic" })
vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, { desc = "Open diagnostic window" })
vim.keymap.set(
  "n",
  "<leader>q",
  function() vim.diagnostic.setloclist() end,
  { desc = "Show all diagnostic messesages" }
)

-- Misc
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader><leader>l", function() vim.cmd [[luafile %]] end, { desc = "Load the current lua file" })
vim.keymap.set({ "n", "i" }, "<C-s>", [[<cmd>w<CR>]], { desc = "Save current file", silent = true })
vim.keymap.set({ "n", "i" }, "<C-S>", [[<cmd>wa<CR>]], { desc = "Save all files", silent = true })

-- Movement
vim.keymap.set({ "n", "v" }, "j", [[v:count || mode(1)[0:1] == "no" ? "j" : "gj" ]], { expr = true })
vim.keymap.set({ "n", "v" }, "k", [[v:count || mode(1)[0:1] == "no" ? "k" : "gk" ]], { expr = true })

-- Undotree
vim.keymap.set("n", "<leader>u", [[<cmd>UndotreeToggle<CR>]], { desc = "Toggle Undotree", silent = true })

-- Fold remap to always show indent-blankline
local fold_keymaps = { "zo", "zO", "zc", "zC", "za", "zA", "zv", "zx", "zX", "zm", "zM", "zr", "zR" }
for _, keymap in pairs(fold_keymaps) do
  vim.keymap.set({ "n" }, keymap, keymap .. "<cmd>IndentBlanklineRefresh<CR>")
end
