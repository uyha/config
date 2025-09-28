return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bitbake_language_server = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "language-server-bitbake" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "bitbake" },
    },
  },
}
