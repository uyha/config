return {
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup()
    end,
    keys = {
      { "<C-h>", mode = "n" },
      { "<C-j>", mode = "n" },
      { "<C-k>", mode = "n" },
      { "<C-l>", mode = "n" },
    },
  },
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>U",
        [[<cmd>UndotreeToggle<CR>]],
        mode = "n",
        { desc = "Toggle Undotree", silent = true },
      },
    },
  },
}
