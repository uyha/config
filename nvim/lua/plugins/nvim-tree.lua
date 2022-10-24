local M = {}

M.setup = function()
  require("nvim-tree").setup()
  vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
  vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>", { silent = true })
end

return M
