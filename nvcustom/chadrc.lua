local M = {}

M.ui = { theme = "onedark" }

M.plugins = {
   user = require "custom.plugins",
   options = {
     lspconfig = {
       setup_lspconf = "custom.plugins.lspconfig"
     }
   }
}

return M
