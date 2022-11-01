vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("BTQuickfixKeyMap", {}),
  callback = function(params)
    if params.file == "qf" then
      vim.keymap.set("n", "q", function() vim.cmd [[cclose]] end, {})
      vim.api.nvim_create_autocmd("WinLeave", {
        group = vim.api.nvim_create_augroup("BTQuickfixAutoClose", {}),
        callback = function() vim.cmd [[cclose]] end,
      })
    end
  end,
})
