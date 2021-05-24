local lsp = require 'lspconfig'
local on_attach = require 'on_attach'

local servers = {'pyright', 'cmake', 'clangd', 'rust_analyzer'}
for _, server in ipairs(servers) do
  lsp[server].setup {
    on_attach = on_attach
  }
end

