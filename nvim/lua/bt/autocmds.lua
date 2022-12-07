-- Close quickfix with 'q' and automatically close quickfix when leave it
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("MyAutoCmdForFileTypes", {}),
  callback = function(params)
    local filetype = vim.bo.filetype
    for _, ft in pairs { "qf", "Trouble" } do
      if filetype == ft then
        vim.keymap.set("n", "q", function() vim.api.nvim_win_close(0, true) end, { buffer = params.buf })
        vim.api.nvim_create_autocmd("WinLeave", {
          group = vim.api.nvim_create_augroup("BTQuickfixAutoClose", {}),
          callback = function() vim.api.nvim_win_close(0, true) end,
          buffer = params.buf,
        })
        break
      end
    end

    for _, ft in pairs { "help", "checkhealth", "tsplayground" } do
      if filetype == ft then
        vim.keymap.set("n", "q", function() vim.api.nvim_win_close(0, true) end, { buffer = params.buf })
        break
      end
    end

    if vim.bo.filetype == "lua" then
      vim.keymap.set("x", "<leader><C-r>", ":source<cr>", { buffer = params.buf, silent = true })
      vim.keymap.set("n", "<leader><C-r>", ":source %<cr>", { buffer = params.buf, silent = true })
    end
  end,
})
