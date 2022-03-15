local cmd = vim.cmd

cmd [[packadd packer.nvim]]
local packer = require "packer"
local use = packer.use

packer.init()

use { "PProvost/vim-ps1" }
use { "RRethy/nvim-base16" }
use { "cespare/vim-toml" }
use { "famiu/feline.nvim" }
use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {}
  end,
}
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {}
  end,
}
use {
  "hrsh7th/nvim-cmp",
  requires = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "quangnguyen30192/cmp-nvim-ultisnips" },
  },
}
use { "kyazdani42/nvim-tree.lua" }
use { "kyazdani42/nvim-web-devicons" }
use { "lambdalisue/suda.vim" }
use { "lukas-reineke/indent-blankline.nvim" }
use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }
use { "mfussenegger/nvim-lint" }
use { "wgwoods/vim-systemd-syntax" }
use { "neovim/nvim-lspconfig" }
use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } }
use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
use { "nvim-treesitter/playground" }
use { "p00f/nvim-ts-rainbow" }
use { "rust-lang/rust.vim" }
use { "sbdchd/neoformat" }
use {
  "sirver/UltiSnips",
  config = function()
    vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
    vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
    vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
    vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
    vim.g.UltiSnipsRemoveSelectModeMappings = 0
  end,
}
use { "tpope/vim-abolish" }
use { "tpope/vim-commentary" }
use { "tpope/vim-fugitive" }
use { "tpope/vim-surround" }
use { "wbthomason/packer.nvim", opt = true }
