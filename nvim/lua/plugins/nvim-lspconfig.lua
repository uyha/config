return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      cssls = {},
      neocmake = {},
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
