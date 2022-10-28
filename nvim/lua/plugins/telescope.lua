local M = {}

M.setup = function()
  vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end)
  vim.keymap.set("n", "<leader>fa", function() require("telescope.builtin").find_files({
    follow = true,
    hidden = true,
    no_ignore = true,
  }) end)
  vim.keymap.set("n", "<leader>fw", function() require("telescope.builtin").live_grep() end)
  vim.keymap.set("n", "<leader>fk", function() require("telescope.builtin").keymaps() end)
end

return M
