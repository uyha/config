-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cmake" },
  callback = function()
    -- There is a bug somewhere that makes the cursor jump 2 lines below the jumping
    -- mark
    vim.keymap.set("n", "<leader>i", "gg=G``kk", { silent = true, buffer = true })
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "ledger" },
  callback = function()
    vim.keymap.set({ "n", "i" }, "<M-i>", function()
      vim.api.nvim_put({ tostring(os.date("%Y-%m-%d")) }, "c", true, true)
      vim.cmd([[startinsert!]])
    end)
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "sql" },
  callback = function() vim.bo.shiftwidth = 4 end,
})
