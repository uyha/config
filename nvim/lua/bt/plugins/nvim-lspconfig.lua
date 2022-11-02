local M = {}

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opt = { buffer = bufnr }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opt)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opt)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opt)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opt)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opt)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opt)
  vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opt)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opt)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opt)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opt)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opt)

  if client.server_capabilities.documentSymbolProvider then require("nvim-navic").attach(client, bufnr) end
end

M.setup = function()
  local lspconfig = require "lspconfig"
  local servers = {
    "bashls",
    "clangd",
    "cssls",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "sumneko_lua",
    "svelte",
    "tsserver",
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup { on_attach = on_attach }
  end
end

return M
