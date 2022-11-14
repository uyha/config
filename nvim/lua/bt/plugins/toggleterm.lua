local M = {}

local termcodes = function(sequence) return vim.api.nvim_replace_termcodes(sequence, true, true, true) end

local termesc = function(sequence) return termcodes("<C-\\><C-N>" .. (sequence or "")) end

local Terminal = require("toggleterm.terminal").Terminal

local main = Terminal:new {
  hidden = false,
  start_in_insert = true,
  on_create = function(term)
    local config = { buffer = term.bufnr, silent = true }

    vim.keymap.set({ "t", "n" }, "<M-t>", function() term:toggle() end, config)

    vim.keymap.set("t", "<Esc>", termesc(), config)
    vim.keymap.set("t", "<C-h>", termesc "<C-w>h", config)
    vim.keymap.set("t", "<C-j>", termesc "<C-w>j", config)
    vim.keymap.set("t", "<C-k>", termesc "<C-w>k", config)
    vim.keymap.set("t", "<C-l>", termesc "<C-w>l", config)
  end,
}

local lazygit = Terminal:new {
  cmd = "lazygit",
  direction = "float",
  hidden = true,
  exit_on_close = true,
  on_close = function() vim.cmd "NvimTreeRefresh" end,
}

M.setup = function()
  require("toggleterm").setup {}

  vim.keymap.set("n", "<M-t>", function() main:toggle() end, { desc = "Open main terminal" })
  vim.keymap.set("n", "<leader>lzg", function() lazygit:open() end, { desc = "Open lazygit" })
end

return M
