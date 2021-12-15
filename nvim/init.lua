local cmd = vim.cmd
local g = vim.g

g.mapleader = " "

require "plugins"
require "mappings"
require "options"
require "variables"
require "setup"
require "branch_mod"

cmd [[lang en_US.utf8]]
cmd [[colorscheme base16-onedark]]
cmd [[
augroup run_lint
  autocmd!
  autocmd BufWritePost * lua require('lint').try_lint()
augroup END
]]
