local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "pyright", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
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
