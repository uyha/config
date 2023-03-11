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
    end,
    cmd = { "NvimTreeRefresh" },
    keys = {
      { "<leader>e", function() vim.cmd([[NvimTreeToggle]]) end, desc = "Toggle nvim-tree" },
      { "<C-f>", function() vim.cmd([[NvimTreeFindFile]]) end, desc = "Show current file in nvim-tree" },
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
