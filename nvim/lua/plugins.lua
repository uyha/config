local cmd = vim.cmd

cmd [[packadd packer.nvim]]
local packer = require('packer')
local use = packer.use

packer.init()

use {'PProvost/vim-ps1'}
use {'cespare/vim-toml'}
use {'joshdick/onedark.vim'}
use {'kyazdani42/nvim-tree.lua'}
use {'kyazdani42/nvim-web-devicons'}
use {'luochen1990/rainbow'}
use {'neovim/nvim-lspconfig'}
use {'nvim-lua/completion-nvim'}
use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
use {'rust-lang/rust.vim'}
use {'sbdchd/neoformat'}
use {'sirver/UltiSnips'}
use {'tpope/vim-commentary'}
use {'tpope/vim-fugitive'}
use {'tpope/vim-surround'}
use {'vim-airline/vim-airline'}
use {'wbthomason/packer.nvim', opt = true}
