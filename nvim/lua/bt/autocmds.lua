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
