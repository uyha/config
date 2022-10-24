local M = {}

local lazygit

local termcodes = function(sequence)
  return vim.api.nvim_replace_termcodes(sequence, true, true, true)
end

local termesc = function(sequence)
  return termcodes("<C-\\><C-N>" .. (sequence or ""))
end

local lazygit_terminal = function()
  return require("toggleterm.terminal").Terminal:new {
    cmd = "lazygit",
    direction = "float",
    hidden = true,
  }
end

local toggle_lazygit = function()
  lazygit = lazygit or lazygit_terminal()
  lazygit:toggle()
end

local on_open = function(term)
  local config = { buffer = true }

  vim.keymap.set("t", "<Esc>", termesc(), config)
  vim.keymap.set("t", "<M-t>", termesc ":ToggleTerm<CR>", config)
  vim.keymap.set("t", "<C-h>", termesc "<C-w>h", config)
  vim.keymap.set("t", "<C-j>", termesc "<C-w>j", config)
  vim.keymap.set("t", "<C-k>", termesc "<C-w>k", config)
  vim.keymap.set("t", "<C-l>", termesc "<C-w>l", config)
end

M.setup = function()
  require("toggleterm").setup {
    on_open = on_open,
  }

  vim.keymap.set("n", "<M-t>", ":ToggleTerm<CR>", { silent = true })
  vim.keymap.set("n", "<leader>lzg", toggle_lazygit)
end

return M
