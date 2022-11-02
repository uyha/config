local M = {}

M.config = function()
  local noice = require "noice"
  local notify = require "notify"
  noice.setup {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        -- ["cmp.entry.get_documentation"] = true,
      },
    },
  }
  vim.keymap.set("n", "<leader>nh", function() noice.cmd "history" end, { desc = "Show history" })
  vim.keymap.set("n", "<leader>nl", function() noice.cmd "last" end, { desc = "Show the last message" })
  vim.keymap.set("n", "<leader>ne", function() noice.cmd "errors" end, { desc = "Show errors" })
  vim.keymap.set("n", "<leader>nt", function() noice.cmd "telescope" end, { desc = "Open messages with Telescope" })

  vim.keymap.set("n", "<leader>nd", function() notify.dismiss() end, { desc = "Dismiss notification" })
end

return M
