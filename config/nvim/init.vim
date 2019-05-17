call plug#begin()
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
call plug#end()

" Line Numbers
set relativenumber
set rnu

set wrap!
set colorcolumn=80

set tabstop=2 shiftwidth=2 expandtab

syntax on
set background=dark
colorscheme solarized
let g:airline_theme='solarized'
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set mouse=a
set clipboard=unnamed
imap kj <Esc>
imap jk <Esc>

let mapleader=" "
