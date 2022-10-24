local M = {}

local termcodes = function(sequence) return vim.api.nvim_replace_termcodes(sequence, true, true, true) end

local termesc = function(sequence) return termcodes("<C-\\><C-N>" .. (sequence or "")) end

local on_open = function(term)
  local config = { buffer = true, silent = true }

  vim.keymap.set("t", "<Esc>", termesc(), config)
  vim.keymap.set("t", "<M-t>", function() term:toggle() end, config)
  vim.keymap.set("t", "<C-h>", termesc "<C-w>h", config)
  vim.keymap.set("t", "<C-j>", termesc "<C-w>j", config)
  vim.keymap.set("t", "<C-k>", termesc "<C-w>k", config)
  vim.keymap.set("t", "<C-l>", termesc "<C-w>l", config)
end

local Terminal = require("toggleterm.terminal").Terminal

local main = Terminal:new {
  hidden = false,
  on_open = on_open,
}

local lazygit = Terminal:new {
  cmd = "lazygit",
  direction = "float",
  hidden = true,
}

M.setup = function()
  require("toggleterm").setup {
    on_open = on_open,
  }

  vim.keymap.set("n", "<M-t>", function() main:toggle() end)
  vim.keymap.set("n", "<leader>lzg", function() lazygit:toggle() end)
end

return M
