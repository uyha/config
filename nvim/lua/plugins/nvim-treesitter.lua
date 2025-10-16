return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "<leader>al",
        function() require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner", "textobjects") end,
        desc = "Swap with next argument",
      },
      {
        "<leader>ah",
        function() require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner", "textobjects") end,
        desc = "Swap with next argument",
      },
    },
  },
}
