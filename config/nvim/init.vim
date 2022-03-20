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
Plug 'altercation/vim-colors-solarized'
call plug#end()

set nocompatible

scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

" Smartcase for search
set ignorecase
set smartcase

" THEME
set rnu
set nu
set wrap!
set colorcolumn=80
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
syntax enable
set background=light
colorscheme solarized

set tabstop=2 shiftwidth=2 expandtab

set mouse=a
set clipboard=unnamed

imap kj <Esc>
imap jk <Esc>
let mapleader=" "

let g:EasyMotion_do_mapping = 0
nmap <Leader><Leader> <Plug>(easymotion-overwin-f)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
vmap <Leader><Leader> <Plug>(easymotion-overwin-f)
vmap <Leader>j <Plug>(easymotion-j)
vmap <Leader>k <Plug>(easymotion-k)

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
