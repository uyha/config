local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   local servers = { "pyright", "bashls" }

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
      on_attach = function(client, bufnr)
         attach(client, bufnr)
         client.resolved_capabilities.document_formatting = false
         client.resolved_capabilities.document_range_formatting = false
      end,
      capabilities = clangd_caps,
   }
end

return M
