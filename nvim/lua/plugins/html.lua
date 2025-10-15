return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "html" },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "prettierd" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["html"] = { "prettierd" },
      },
    },
  },
}
