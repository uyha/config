-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("t", "<esc><esc>")

vim.keymap.set({ "n", "i", "t" }, "<M-]>", "<cmd>vertical resize +5<CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<M-[>", "<cmd>vertical resize -5<CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<M-=>", "<cmd>resize +5<CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<M-->", "<cmd>resize -5<CR>", { silent = true })
