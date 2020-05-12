" Set shell to bash
set shell=/bin/bash

" Vundle settings and initialization
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dag/vim-fish'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-commentary'

call vundle#end()            " required
filetype plugin indent on    " required

" Vim solorized
syntax enable
set background=dark
colorscheme solarized

" Set tab and shift width
set tabstop=2
set shiftwidth=2
set expandtab

" Number column
set number relativenumber
