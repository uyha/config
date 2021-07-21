local cmd = vim.cmd

cmd [[packadd packer.nvim]]
local packer = require "packer"
local use = packer.use

packer.init()

use { "PProvost/vim-ps1" }
use { "RRethy/nvim-base16" }
use { "cespare/vim-toml" }
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {}
  end,
}
use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {}
  end,
}
use { "hrsh7th/nvim-compe" }
use { "kyazdani42/nvim-tree.lua" }
use { "kyazdani42/nvim-web-devicons" }
use { "neovim/nvim-lspconfig" }
use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } }
use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
use { "nvim-treesitter/playground" }
use { "p00f/nvim-ts-rainbow" }
use { "rust-lang/rust.vim" }
use { "sbdchd/neoformat" }
use { "sirver/UltiSnips" }
use { "tpope/vim-commentary" }
use { "tpope/vim-fugitive" }
use { "tpope/vim-surround" }
use { "vim-airline/vim-airline" }
use { "vim-airline/vim-airline-themes" }
use { "wbthomason/packer.nvim", opt = true }
