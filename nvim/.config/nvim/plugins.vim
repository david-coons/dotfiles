filetype off

call plug#begin()

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind-nvim'
Plug 'dense-analysis/ale'

Plug 'sheerun/vim-polyglot'

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

Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

Plug 'mechatroner/rainbow_csv'

" Plug 'ludovicchabant/vim-gutentags'
" Plug 'preservim/tagbar'
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
" Plug 'felixhummel/setcolors.vim'
" Plug 'jamessan/vim-gnupg'
" Plug 'mattn/webapi-vim'
" Plug 'mattn/gist-vim'
" Plug 'ggandor/lightspeed.nvim'

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\.swo', '\.swp', '\.git', '\.svn']

let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
set laststatus=2

let g:Gitv_OpenHorizontal = 1

let g:vimwiki_list = [{'path': '~/notes/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'path_html': '~/notes/vimwiki_html'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

call plug#end()
