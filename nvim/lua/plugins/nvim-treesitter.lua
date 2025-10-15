return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = {
      select = {
        enable = true,
        lookahead = true,
      },
      swap = {
        enable = true,
        swap_next = { ["<leader>tl"] = "@parameter.inner" },
        swap_previous = { ["<leader>th"] = "@parameter.inner" },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]a"] = "@parameter.inner",
        },
        goto_previous_start = {
          ["[a"] = "@parameter.inner",
        },
      },
    },
  },
}
