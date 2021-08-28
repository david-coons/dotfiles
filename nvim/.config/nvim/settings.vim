filetype plugin indent on
syntax on
set nocompatible

let mapleader = " "
let maplocalleader = " "

set encoding=utf-8
set splitbelow
set splitright
set scrolloff=3
set showmode
set showcmd
set switchbuf=useopen
set ruler
set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END

set wildmenu
set nobackup
set hidden
set display=uhex
set visualbell
set noerrorbells
set printoptions=paper:letter,right:1in,left:54pt,wrap:y,duplex:long
" set dir=~/.vim/swap//

set gdefault
set incsearch
set hlsearch
set showmatch
set ignorecase smartcase

set tabstop=4
set shiftwidth=4
set softtabstop=4
set nosta
set expandtab

" Tags 
set tags=./tags,./TAGS,tags;~,TAGS;~

" Appearance
set termguicolors
colors nord
" colors monochrome
" colors jellybeans
" set background=dark
set gfn=Droid\ Sans\ Mono\ 10
"set gfn=Source\ Code\ Pro\ Medium\ 10

" Folding
"set foldmethod=syntax
"set foldnestmax=10
"set nofoldenable
"set foldlevel=1
