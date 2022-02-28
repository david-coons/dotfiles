filetype off

call plug#begin()

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Plug 'ludovicchabant/vim-gutentags'
"Plug 'preservim/tagbar'

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

set completeopt=menu,menuone,noselect

lua << EOF

  local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
  sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "vsnip" },
    }, {
      { name = "buffer" },
  }),
  formatting = {
    format = require("lspkind").cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
      },
    }),
  },
})

 cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- tell nvim-cmp about our desired capabilities
  require("cmp_nvim_lsp").update_capabilities(capabilities)
end

-- Finally, let's initialize the Elixir language server

-- Replace the following with the path to your installation
local path_to_elixirls = vim.fn.expand("~/language-servers/elixir-ls/release/language_server.sh")

lspconfig.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = true,
      enableTestLenses = true,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
})

lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach
})
EOF

