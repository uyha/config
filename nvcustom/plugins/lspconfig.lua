local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   local servers = {}

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end

   -- Temporary fix for warning of multiple offsetEncoding set from multiple servers
   local clangd_caps = vim.tbl_deep_extend("force", capabilities, {
      offsetEncoding = { "utf-16" },
   })
   lspconfig["clangd"].setup {
      on_attach = attach,
      capabilities = clangd_caps,
   }
end

return M
