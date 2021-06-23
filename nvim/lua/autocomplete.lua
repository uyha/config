require'compe'.setup {
  source = {
    path = true;
    buffer = true;
    calc = true;
    spell = true;
    tags = true;
    nvim_lsp = true;
    nvim_lua = true;
    ultisnips = true;
  };
}

vim.cmd[[
  inoremap <silent><expr> <C-k> compe#complete()
  inoremap <silent><expr> <CR>      compe#confirm('<CR>')
  inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
]]
