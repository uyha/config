local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd

cmd([[set foldmethod=expr]])
cmd([[set foldexpr=nvim_treesitter#foldexpr()]])

vim.opt.relativenumber = true

autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end
})

autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end
})
