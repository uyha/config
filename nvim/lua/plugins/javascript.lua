return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "tsx",
        "typescript",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "prettierd" },
      },
    },
  },
}
