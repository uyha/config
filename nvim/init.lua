-- Adapted from https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua
require 'lsp'
require 'mappings'
require 'options'
require 'plugins'
require 'treesitter'
require 'variables'

local cmd = vim.cmd
cmd 'lang en_US.utf8'
cmd 'colorscheme onedark'

