local cmd = vim.cmd

cmd 'packadd packer.nvim'
local packer = require('packer')
local use = packer.use

packer.init()

use {'wbthomason/packer.nvim', opt = true}
use {'joshdick/onedark.vim'}
