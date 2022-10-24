local termcodes = function(sequence)
  return vim.api.nvim_replace_termcodes(sequence, true, true, true)
end
local termesc = function(sequence)
  return termcodes("<C-\\><C-N>" .. (sequence or ""))
end

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>", { silent = true })

local lazygit = require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
vim.keymap.set("n", "<M-t>", ":ToggleTerm<CR>", { silent = true })
vim.keymap.set("n", "<leader>lzg", function() lazygit:toggle() end, { silent = true })

vim.keymap.set("t", "<Esc>", termesc())
vim.keymap.set("t", "<M-t>", termesc ":ToggleTerm<CR>")
vim.keymap.set("t", "<C-h>", termesc "<C-w>h")
vim.keymap.set("t", "<C-j>", termesc "<C-w>j")
vim.keymap.set("t", "<C-k>", termesc "<C-w>k")
vim.keymap.set("t", "<C-l>", termesc "<C-w>l")
