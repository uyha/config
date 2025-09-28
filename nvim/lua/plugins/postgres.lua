return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        postgres_lsp = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "postgrestools" },
    },
  },
}
