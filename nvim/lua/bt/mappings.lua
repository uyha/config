-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Packer
vim.keymap.set("n", "<leader><leader>s", function() vim.cmd [[PackerSync]] end, { desc = "Run PackerSync" })

-- nvim-tree
vim.keymap.set("n", "<C-n>", function() vim.cmd [[NvimTreeToggle]] end)
vim.keymap.set("n", "<C-f>", function() vim.cmd [[NvimTreeFindFile]] end)

-- LSP
vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, { desc = "Open diagnostic window" })
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Go to the previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Go to the next diagnostic" })
vim.keymap.set(
  "n",
  "<leader>q",
  function() vim.diagnostic.setloclist() end,
  { desc = "Add diagnostic to the location list" }
)

-- Noice
vim.keymap.set("n", "<leader>nh", function() require("noice").cmd "history" end, { desc = "Show history" })
vim.keymap.set("n", "<leader>nl", function() require("noice").cmd "last" end, { desc = "Show the last message" })
vim.keymap.set("n", "<leader>ne", function() require("noice").cmd "errors" end, { desc = "Show errors" })
vim.keymap.set(
  "n",
  "<leader>nt",
  function() require("noice").cmd "telescope" end,
  { desc = "Open messages with Telescope" }
)

-- Misc
vim.keymap.set({ "n", "v" }, "<leader>p", [["*p]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]])
vim.keymap.set("n", "<leader><leader>l", function() vim.cmd [[luafile %]] end, { desc = "Load the current lua file" })

-- Movement
vim.keymap.set("n", "j", [[v:count || mode(1)[0:1] == "no" ? "j" : "gj" ]], { expr = true })
vim.keymap.set("n", "k", [[v:count || mode(1)[0:1] == "no" ? "k" : "gk" ]], { expr = true })
