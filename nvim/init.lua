-- Adapted from https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua

local cmd = vim.cmd
local g   = vim.g

g.mapleader = ' '

require 'plugins'
require 'mappings'
require 'options'
require 'variables'
require 'setup'
require 'branch_mod'

cmd [[lang en_US.utf8]]
cmd [[colorscheme base16-onedark]]
-- Automatically format file when it is saved
cmd [[
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]]

