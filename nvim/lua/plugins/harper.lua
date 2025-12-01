return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              linters = {
                Dashes = false,
                ExpandMemoryShorthands = false,
                ExpandTimeShorthands = false,
                ToDoHyphen = false,
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
