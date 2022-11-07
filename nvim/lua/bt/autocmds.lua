-- Close quickfix with 'q' and automatically close quickfix when leave it
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("BTQuickfixKeyMap", {}),
  callback = function(params)
    if vim.bo.filetype == "qf" then
      vim.keymap.set("n", "q", function() vim.api.nvim_win_close(0, true) end, { buffer = params.buf })
      vim.api.nvim_create_autocmd("WinLeave", {
        group = vim.api.nvim_create_augroup("BTQuickfixAutoClose", {}),
        callback = function() vim.api.nvim_win_close(0, true) end,
        buffer = params.buf,
      })
    end
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("BTHelpKeyMap", {}),
  callback = function(params)
    if vim.bo.filetype == "help" or vim.bo.filetype == "checkhealth" then
      vim.keymap.set("n", "q", function() vim.api.nvim_win_close(0, true) end, { buffer = params.buf })
    end
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("BTNvimLuaSource", {}),
  callback = function(params)
    if vim.bo.filetype == "lua" then
      vim.keymap.set("x", "<C-r>", ":source<cr>", { buffer = params.buf, silent = true })
    end
  end,
})
