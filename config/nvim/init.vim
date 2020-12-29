" init.vim --- (Neo)vim configuration.
" My intention is to keep this configuration *as simple as possible*. As a
" matter of philosophy I would rather use external tools than configure a text
" editor.

" Vim-Plugs should be loaded before the rest of the configuration
"
" To install vim-plug for neovim:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Useful commands for me, a vim-noob.
" PlugUpdate
" PluClean
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

set nocompatible

scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

" Smartcase for search
set ignorecase
set smartcase

set rnu
set nu

set wrap!

set colorcolumn=80

syntax enable
set background=dark
colorscheme solarized

set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set t_Co=256

set tabstop=2 shiftwidth=2 expandtab

set mouse=a
set clipboard=unnamed

imap kj <Esc>
imap jk <Esc>
let mapleader=" "
nmap <Space><Space> <Plug>(easymotion-overwin-f)

" Spell check
set spelllang=en
set spell

" Delete trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Files
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
  let g:pandoc#syntax#conceal#use = 0
  au BufRead,BufNewFile *.md setlocal spell
  au BufRead,BufNewFile *.md setlocal complete+=kspell
  au BufRead,BufNewFile *.md setlocal tw=79
augroup END

augroup latex
  au BufRead,BufNewFile *.tex setlocal spell
  au BufRead,BufNewFile *.tex setlocal complete+=kspell
  au BufRead,BufNewFile *.tex setlocal tw=79
augroup END

source ~/.config/nvim/google_config.vim
