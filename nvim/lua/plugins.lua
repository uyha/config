local cmd = vim.cmd

cmd 'packadd packer.nvim'
local packer = require('packer')
local use = packer.use

packer.init()

use {'PProvost/vim-ps1'}
use {'cespare/vim-toml'}
use {'joshdick/onedark.vim'}
use {'tpope/vim-commentary'}
use {'tpope/vim-fugitive'}
use {'tpope/vim-surround'}
use {'wbthomason/packer.nvim', opt = true}
