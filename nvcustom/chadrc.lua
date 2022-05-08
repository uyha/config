local M = {}

M.ui = { theme = "tokyodark" }

M.plugins = {
   user = require "custom.plugins",
   options = {
     lspconfig = {
       setup_lspconf = "custom.plugins.lspconfig"
     }
   }
}

return M
