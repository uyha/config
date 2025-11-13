return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
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
  },
}
