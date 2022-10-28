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
end

local servers = { "pyright", "bashls", "svelte", "tsserver", "rust_analyzer", "cssls", "jsonls", "sumneko_lua" }
local capabilities = require("cmp_nvim_lsp").default_capabilities()

M.setup = function()
  for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup { on_attach = on_attach, capabilities = capabilities }
  end
end

return M
