local M = {}

M.setup = function()
  vim.api.nvim_create_autocmd({ "BufRead" }, {
    group = vim.api.nvim_create_augroup("BTGitSignsLazyLoad", {}),
    callback = function()
      vim.fn.system("git -C " .. vim.fn.expand "%:p:h" .. " rev-parse")
      if vim.v.shell_error == 0 then
        vim.api.nvim_del_augroup_by_name "BTGitSignsLazyLoad"
        vim.schedule(function() require("packer").loader "gitsigns.nvim" end)
      end
    end,
  })
end

M.config = function()
  require("gitsigns").setup {
    on_attach = function(bufnr)
      local gitsigns = require "gitsigns"

      vim.keymap.set({ "n" }, "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gitsigns.next_hunk() end)
        return "<Ignore>"
      end, { expr = true, buffer = bufnr, desc = "Go to the next hunk" })

      vim.keymap.set({ "n" }, "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gitsigns.prev_hunk() end)
        return "<Ignore>"
      end, { expr = true, buffer = bufnr, desc = "Go to the previous hunk" })

      vim.keymap.set(
        { "n", "v" },
        "<leader>hs",
        gitsigns.stage_hunk,
        { buffer = bufnr, desc = "Stage the current hunk" }
      )
      vim.keymap.set(
        { "n", "v" },
        "<leader>hr",
        gitsigns.reset_hunk,
        { buffer = bufnr, desc = "Reset the current hunk" }
      )
      vim.keymap.set({ "n" }, "<leader>hS", gitsigns.stage_buffer, { buffer = bufnr, desc = "Stage the current file" })
      vim.keymap.set({ "n" }, "<leader>hu", gitsigns.undo_stage_hunk, { buffer = bufnr, desc = "Undo last hunk stage" })
      vim.keymap.set({ "n" }, "<leader>hR", gitsigns.reset_buffer, { buffer = bufnr, desc = "Reset the current file" })
      vim.keymap.set(
        { "n" },
        "<leader>hp",
        gitsigns.preview_hunk,
        { buffer = bufnr, desc = "Preview the current hunk" }
      )
      vim.keymap.set(
        { "n" },
        "<leader>hb",
        function() gitsigns.blame_line { full = true } end,
        { buffer = bufnr, desc = "Show blame of the current line" }
      )
      vim.keymap.set(
        { "n" },
        "<leader>tb",
        gitsigns.toggle_current_line_blame,
        { buffer = bufnr, desc = "Toggle blame of the current line" }
      )
    end,
  }
end

return M
