return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "main",
    keys = {
      { "<leader>vc", "<cmd>:VenvSelectCached<cr>", desc = "Select the previous venv for this project" },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "black" },
    },
  },
}
