" To install vim-plug for neovim:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Useful commands for me, a vim-noob.
" PlugUpdate
" PluClean
call plug#begin()
Plug 'tpope/vim-surround'
call plug#end()

" Encoding
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

" Line Numbers
set rnu
set nu

" Theme
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

" Spell check
set spelllang=en
set spell

" Delete trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
