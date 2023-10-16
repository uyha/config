return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-tree/nvim-tree.lua" },
  keys = {
    {
      "<leader>fa",
      function()
        require("telescope.builtin").find_files({
          find_command = { "fd", "--no-ignore", "--hidden", "--exclude", ".git", "--exclude", ".idea" },
        })
      end,
      desc = "Fuzzy find everything",
    },
  },
}
