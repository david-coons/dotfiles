filetype off

call plug#begin()

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Plug 'ludovicchabant/vim-gutentags'
"Plug 'preservim/tagbar'

Plug 'scrooloose/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'slashmili/alchemist.vim'
" Plug 'zchee/deoplete-jedi'

Plug 'elixir-editors/vim-elixir'

" Plug 'dense-analysis/ale'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'flazz/vim-colorschemes'
Plug 'Lokaltog/vim-monotone'
Plug 'arcticicestudio/nord-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-unimpaired'
Plug 'moll/vim-bbye'
Plug 'ggandor/lightspeed.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

" Plug 'Lokaltog/vim-easymotion'
" Plug 'junegunn/vim-easy-align'
" Plug 'https://github.com/kshenoy/vim-signature'
" Plug 'klen/python-mode'
" Plug 'pangloss/vim-javascript'
" Plug 'elzr/vim-json'
" Plug 'ternjs/tern_for_vim'
" Plug 'posva/vim-vue'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-classpath'
" Plug 'guns/vim-clojure-static'
" Plug 'https://github.com/vim-scripts/paredit.vim'
" Plug 'https://github.com/guns/vim-sexp.git'
" Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'https://github.com/mileszs/ack.vim.git'
" Plug 'https://github.com/sjbach/lusty.git'
" Plug 'jlanzarotta/bufexplorer'
" Plug 'https://github.com/alvan/vim-closetag'
" Plug 'mattn/calendar-vim'
" Plug 'felixhummel/setcolors.vim'
" Plug 'jamessan/vim-gnupg'
" Plug 'mattn/webapi-vim'
" Plug 'mattn/gist-vim'

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#sources = {}
"
" Javacomplete2 {{{
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\.swo', '\.swp', '\.git', '\.svn']

" Airline 
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
set laststatus=2

let g:Gitv_OpenHorizontal = 1

call plug#end()

let g:coc_global_extensions = [
  \ 'coc-marketplace',
  \ 'coc-html',
  \ 'coc-yaml', 
  \ 'coc-xml', 
  \ 'coc-tsserver',
  \ 'coc-sql', 
  \ 'coc-solargraph', 
  \ 'coc-sh', 
  \ 'coc-sql', 
  \ 'coc-json', 
  \ 'coc-jedi', 
  \ 'coc-java', 
  \ 'coc-elixir', 
  \ ]
