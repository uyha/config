local lsp = require 'lspconfig'
local on_attach = require 'utils'.on_attach

lsp['bashls'].setup{
  on_attach = on_attach
}
