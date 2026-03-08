return {
  { "folke/tokyonight.nvim", enabled = false },
  { "nvim-mini/mini.surround", enabled = false },
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
    },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {
      surrounds = {
        ["d"] = {
          add = { "if (false) {", "}" },
          delete = "(if%s*%(%s*false%s*%)%s*{)().*(})()",
          find = "(if%s*%(%s*false%s*%)%s*{)().*(})()",
        },
      },
    },
    keys = {
      {
        "s",
        "<Plug>(nvim-surround-visual)",
        desc = "Add a surrounding pair around a visual selection",
        mode = "x",
      },
      {
        "gs",
        "<Plug>(nvim-surround-visual-line)",
        desc = "Add a surrounding pair around a visual selection, on new lines",
        mode = "x",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bl", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bh", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    },
  },
  {
    "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {},

    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
    end,
  },
}
