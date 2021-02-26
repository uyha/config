local cmd = vim.cmd

cmd 'packadd packer.nvim'
local packer = require('packer')
local use = packer.use

packer.init()

use {'PProvost/vim-ps1'}
use {'cespare/vim-toml'}
use {'joshdick/onedark.vim'}
use {'luochen1990/rainbow'}
use {'neovim/nvim-lspconfig'}
use {'nvim-lua/completion-nvim'}
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
use {'tpope/vim-commentary'}
use {'tpope/vim-fugitive'}
use {'tpope/vim-surround'}
use {'vim-airline/vim-airline'}
use {'wbthomason/packer.nvim', opt = true}
