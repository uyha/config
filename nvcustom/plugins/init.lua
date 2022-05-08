return {
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   ["tpope/vim-abolish"] = {},
   ["tpope/vim-fugitive"] = {},
   ["tpope/vim-surround"] = {},
}
