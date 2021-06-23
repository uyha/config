-- Adapted from https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua

local cmd = vim.cmd
local g   = vim.g

g.mapleader = ' '

require 'plugins'
require 'lsp'
require 'mappings'
require 'options'
require 'treesitter'
require 'variables'
require 'autocmd'
require 'autocomplete'
require 'branch_mod'

cmd [[lang en_US.utf8]]
cmd [[colorscheme onedark]]

