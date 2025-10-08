return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              linters = {
                ExpandTimeShorthands = false,
                ToDoHyphen = false,
                Dashes = false,
              },
            },
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "harper-ls" },
    },
  },
}
