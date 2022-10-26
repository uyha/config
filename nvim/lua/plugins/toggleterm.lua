local M = {}

local termcodes = function(sequence) return vim.api.nvim_replace_termcodes(sequence, true, true, true) end

local termesc = function(sequence) return termcodes("<C-\\><C-N>" .. (sequence or "")) end

local Terminal = require("toggleterm.terminal").Terminal

local main = Terminal:new {
  hidden = false,
  on_create = function(term)
    local config = { buffer = term.bufnr, silent = true }

    vim.keymap.set({ "t", "n" }, "<M-t>", function() term:close() end, config)

    vim.keymap.set("t", "<Esc>", termesc(), config)
    vim.keymap.set("t", "<C-h>", termesc "<C-w>h", config)
    vim.keymap.set("t", "<C-j>", termesc "<C-w>j", config)
    vim.keymap.set("t", "<C-k>", termesc "<C-w>k", config)
    vim.keymap.set("t", "<C-l>", termesc "<C-w>l", config)

    vim.api.nvim_create_autocmd({ "TermEnter" }, {
      group = vim.api.nvim_create_augroup("MyToggleTermMain", { clear = true }),
      buffer = term.bufnr,
      callback = function() vim.cmd [[startinsert]] end,
    })
  end,
}

local lazygit = Terminal:new {
  cmd = "lazygit",
  direction = "float",
  hidden = true,
  on_close = function() vim.cmd "NvimTreeRefresh" end,
}

M.setup = function()
  require("toggleterm").setup {
    on_open = on_open,
  }

  vim.keymap.set("n", "<M-t>", function() main:open() end)
  vim.keymap.set("n", "<leader>lzg", function() lazygit:open() end)
end

return M
