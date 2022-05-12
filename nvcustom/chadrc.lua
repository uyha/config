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
      ["NvChad/nvterm"] = {
         mappings = {
            toggle = {
               float = "<A-i>",
               horizontal = "<A-t>",
               vertical = "<A-v>",
            },
         },
      },
   },
}

return M
