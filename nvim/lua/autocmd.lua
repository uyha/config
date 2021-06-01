vim.api.vim_exec[[
  autogroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
]]
