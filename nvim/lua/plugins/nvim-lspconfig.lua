return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {},
      clangd = {
        cmd = {
          "clangd",
          "--clang-tidy",
          "--header-insertion=never",
        },
      },
      cssls = {},
      neocmake = {},
      pyright = {},
      rust_analyzer = {},
      svelte = {},
      tsserver = {},
    },
    setup = {
      clangd = function(_, opts) opts.capabilities.offsetEncoding = "utf-8" end,
    },
  },
}
