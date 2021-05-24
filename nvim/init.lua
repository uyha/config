-- Adapted from https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua

local cmd = vim.cmd
local g   = vim.g

g.mapleader = ' '

require 'lsp'
require 'mappings'
require 'options'
require 'plugins'
require 'treesitter'
require 'variables'

cmd [[lang en_US.utf8]]
cmd [[colorscheme onedark]]
cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]

