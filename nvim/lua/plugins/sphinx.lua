return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "rst" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        esbonio = {},
      },
    },
  },
}
