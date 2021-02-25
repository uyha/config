-- Adapted from https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua
local cmd = vim.cmd

require 'options'
require 'variables'
require 'mappings'
require 'plugins'
require 'lsp'
require 'treesitter'

cmd 'lang en_US.utf8'
cmd 'colorscheme onedark'

