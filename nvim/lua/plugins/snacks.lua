return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
            },
          },
        },
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["<C-l>"] = { function() vim.cmd([[wincmd l]]) end },
                  ["z"] = "explorer_close_all",
                },
              },
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>fa",
        function() require("snacks").picker.files({ hidden = true }) end,
        desc = "Find files (including hidden)",
      },
      {
        "<leader>fi",
        function() require("snacks").picker.files({ hidden = true, ignored = true }) end,
        desc = "Find all files",
      },
    },
  },
}
