local on_attach = function(client, bufnr)
  local map = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opt = function(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  opt('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  map('n', '<C-k>', [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
  map('n', '<leader>D', [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], opts)
  map('n', '<leader>e', [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], opts)
  map('n', '<leader>q', [[<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>]], opts)
  map('n', '<leader>rn', [[<cmd>lua vim.lsp.buf.rename()<CR>]], opts)
  map('n', '<leader>wa', [[<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>]], opts)
  map('n', '<leader>wl', [[<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>]], opts)
  map('n', '<leader>wr', [[<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>]], opts)
  map('n', 'K', [[<Cmd>lua vim.lsp.buf.hover()<CR>]], opts)
  map('n', '[d', [[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]], opts)
  map('n', ']d', [[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]], opts)
  map('n', 'gD', [[<Cmd>lua vim.lsp.buf.declaration()<CR>]], opts)
  map('n', 'gd', [[<Cmd>lua vim.lsp.buf.definition()<CR>]], opts)
  map('n', 'gi', [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
  map('n', 'gr', [[<cmd>lua vim.lsp.buf.references()<CR>]], opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    map('n', '<leader>f', [[<cmd>lua vim.lsp.buf.formatting()<CR>]], opts)
  elseif client.resolved_capabilities.document_range_formatting then
    map('n', '<leader>f', [[<cmd>lua vim.lsp.buf.range_formatting()<CR>]], opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

return on_attach
