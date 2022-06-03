return {
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   ["tpope/vim-abolish"] = {},
   ["tpope/vim-surround"] = {},
   ["L3MON4D3/LuaSnip"] = {
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
         require("custom.plugins.luasnip").setup()
      end,
   },
   ["wgwoods/vim-systemd-syntax"] = {},
}
