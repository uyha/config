" Vundle settings and initialization
set nocompatible              " be iMproved, required
filetype off                  " required

" Starting Vundle
if has("win32")
  set rtp+=D:\Local\nvim\bundle\Vundle.vim
  call vundle#begin('D:\Local\nvim\bundle\')
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-commentary'
Plugin 'sonph/onehalf', {'rtp': 'vim'}
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'cespare/vim-toml'

" Plugins for Windows
if has("win32")
  Plugin 'PProvost/vim-ps1' 
else
  Plugin 'dag/vim-fish'
  Plugin 'ycm-core/YouCompleteMe'
endif

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader="-"

" Vim colorscheme
syntax on
set background=dark
colorscheme onehalfdark

" Set tab and shift width
set tabstop=2
set shiftwidth=2
set expandtab

set number relativenumber " Number column
set virtualedit=block " Visual selection
set smartcase " Ignore case when search words are all lower case

" Set language
language en_US.utf8

nnoremap <leader>= m`gg=G``
nnoremap <leader>v ggVG
