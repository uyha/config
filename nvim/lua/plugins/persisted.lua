return {
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup({
        autoload = true,
      })

      vim.keymap.set("n", "<leader>qs", function() require("persisted").load() end, { desc = "Restore Session" })
      vim.keymap.set(
        "n",
        "<leader>ql",
        function() require("persisted").load({ last = true }) end,
        { desc = "Restore Last Session" }
      )
      vim.keymap.set(
        "n",
        "<leader>qd",
        function() require("persisted").stop() end,
        { desc = "Don't Save Current Session" }
      )
    end,
  },
}
