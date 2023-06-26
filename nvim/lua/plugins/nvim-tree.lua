return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            resize_window = false,
          },
        },
      })
      vim.keymap.set(
        "n",
        "<leader>e",
        function() require("nvim-tree.api").tree.toggle() end,
        { desc = "Toggle nvim-tree" }
      )
      vim.keymap.set(
        "n",
        "<M-f>",
        function() require("nvim-tree.api").tree.find_file({ open = true, focus = true }) end,
        { desc = "Show current file in nvim-tree" }
      )
    end,
    keys = {
      { "<leader>e", desc = "Toggle nvim-tree" },
      { "<M-f>", desc = "Show current file in nvim-tree" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
}
