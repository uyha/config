local cmd = vim.cmd
local g = vim.g

g.mapleader = " "

require "plugins"
require "mappings"
require "options"
require "variables"
require "setup"
require "branch_mod"
require "statusline"

cmd [[lang en_US.utf8]]
cmd [[colorscheme base16-onedark]]
-- Automatically format file when it is saved
cmd [[
augroup fmt
  autocmd!
  autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
]]
