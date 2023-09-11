return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    {
      "<leader>ha",
      function() require("harpoon.mark").add_file() end,
      mode = { "n" },
      desc = "Harpoon: Mark current bufffer",
    },
    {
      "<leader>hd",
      function() require("harpoon.mark").rm_file() end,
      mode = { "n" },
      desc = "Harpoon: Remove current bufffer",
    },
    {
      "<leader>hu",
      function() require("harpoon.ui").toggle_quick_menu() end,
      mode = { "n" },
      desc = "Harpoon: Toggle quick menu",
    },
    {
      "<leader>1",
      function() require("harpoon.ui").nav_file(1) end,
      mode = { "n" },
      desc = "Harpoon: Navigate to 1st file",
    },
    {
      "<leader>2",
      function() require("harpoon.ui").nav_file(2) end,
      mode = { "n" },
      desc = "Harpoon: Navigate to 2nd file",
    },
    {
      "<leader>3",
      function() require("harpoon.ui").nav_file(3) end,
      mode = { "n" },
      desc = "Harpoon: Navigate to 3rd file",
    },
    {
      "<leader>4",
      function() require("harpoon.ui").nav_file(4) end,
      mode = { "n" },
      desc = "Harpoon: Navigate to 4th file",
    },
    {
      "_",
      function() require("harpoon.ui").nav_prev() end,
      mode = { "n" },
      desc = "Harpoon: Navigate to next file",
    },
    {
      "+",
      function() require("harpoon.ui").nav_next() end,
      mode = { "n" },
      desc = "Harpoon: Navigate to next file",
    },
  },
}
