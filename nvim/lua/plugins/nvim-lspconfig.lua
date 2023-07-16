return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {},
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--header-insertion=iwyu",
          "--clang-tidy",
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
