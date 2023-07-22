return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {},
      cssls = {},
      neocmake = {},
      pyright = {},
      rust_analyzer = {},
      svelte = {},
      tsserver = {},

      clangd = {
        keys = {
          { "<leader>cs", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
      },
    },
  },
}
