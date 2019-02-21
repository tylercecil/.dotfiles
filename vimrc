" VUNDLE PLUGINS FIRST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'easymotion/vim-easymotion'


call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Line Numbers
set relativenumber
set rnu

set wrap!
set colorcolumn=80

syntax on
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set mouse=a
set clipboard=unnamed
imap kj <Esc>
imap jk <Esc>

let mapleader=" "
