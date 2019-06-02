" call plug#begin()
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
" call plug#end()

" Encoding
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

" Line Numbers
set rnu
set nu

set wrap!
set colorcolumn=80

syntax on
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set t_Co=256

set tabstop=2 shiftwidth=2 expandtab

set mouse=a
set clipboard=unnamed

imap kj <Esc>
imap jk <Esc>
let mapleader=" "
