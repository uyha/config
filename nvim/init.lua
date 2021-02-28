-- Adapted from https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua

require 'options'
require 'variables'       --'variables' needs to be loaded before 'mapping'
require 'plugins'
require 'mappings'
require 'treesitter'
require 'lsp'

local cmd = vim.cmd
cmd 'lang en_US.utf8'
cmd 'colorscheme onedark'
cmd "autocmd BufEnter * lua require'completion'.on_attach()"

