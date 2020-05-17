" Vundle settings and initialization
set nocompatible              " be iMproved, required
filetype off                  " required

" Starting Vundle
if has("win32")
  set rtp+=D:/Applications/Vim/bundle/Vundle.vim
  call vundle#begin('D:/Applications/Vim/bundle')
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

Plugin 'VundleVim/Vundle.vim'
Plugin 'dag/vim-fish'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-commentary'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'sonph/onehalf', {'rtp': 'vim'}

" Plugins for Windows
if has("win32")
 Plugin 'PProvost/vim-ps1' 
endif

call vundle#end()            " required
filetype plugin indent on    " required

" Vim colorscheme
syntax on
set background=dark
colorscheme onehalfdark

" Set tab and shift width
set tabstop=2
set shiftwidth=2
set expandtab

" Number column
set number relativenumber

" Visual selection
set virtualedit=block

" Set language
language en_US.utf8
