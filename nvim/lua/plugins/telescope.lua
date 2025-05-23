return {
  {
    "nvim-telescope/telescope.nvim",
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
      {
        "<leader><space>",
        require("lazyvim.util").pick("files", {}),
        desc = "Find Files (cwd)",
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function() require("telescope").load_extension("file_browser") end,
    keys = {
      { "<leader>fB", "<cmd>Telescope file_browser<CR>", desc = "Open Telescope File Browser" },
    },
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          undo = {
            layout_strategy = "vertical",
            initial_mode = "normal",
          },
        },
      })
      require("telescope").load_extension("undo")
    end,
    keys = {
      { "<leader>fu", "<cmd>Telescope undo<CR>", desc = "Open Telescope Undo" },
    },
  },
}
