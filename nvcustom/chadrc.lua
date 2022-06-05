local M = {}

M.ui = { theme = "onedark" }

M.plugins = {
   user = require "custom.plugins",
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   override = {
      ["kyazdani42/nvim-tree.lua"] = {
         actions = {
            open_file = {
               resize_window = false,
            },
         },
      },
   },
}

M.mappings = require "custom.mappings"
return M
