
nnoremap <leader><leader>h :nohlsearch<cr>
nnoremap <tab> %
vnoremap <tab> %

" Buffer navigation
nmap <silent> <S-UP>   :bp<CR>
nmap <silent> <S-DOWN> :bn<CR>

" Window movement
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Window resizing
map <silent> <A-h> <C-w><
map <silent> <A-H> 7<C-w><

map <silent> <A-j> <C-W>-
map <silent> <A-J> 7<C-W>-

map <silent> <A-k> <C-W>+
map <silent> <A-K> 7<C-W>+

map <silent> <A-l> <C-w>>
map <silent> <A-L> 7<C-w>>

" clipboard copy/paste
vmap <Leader>c "+y
map <Leader>v "+gp
map <Leader>V "+gP

" FZF
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>a :Ag<CR>
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <Leader>bl :BLines<CR>
nnoremap <silent> <Leader>t :Tags<CR>
nnoremap <silent> <Leader>bt :BTags<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <Leader>s :History/<CR>
nnoremap <silent> <Leader>m :Marks<CR>
nnoremap <silent> <Leader>c :Commits<CR>

" tagbar
nnoremap <silent> <Leader><Leader>b :TagbarToggle<CR>

" bbye 
nnoremap <silent> <Leader>d :Bdelete<CR>

" NERD Tree {{{
nnoremap <silent> <Leader><Leader>t :NERDTreeToggle<cr>

" git bindings 
nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>ge :Gedit<cr>
nmap <silent> <leader>gd :Gdiff<cr>
nmap <silent> <leader>gp :Git push<cr>
nmap <silent> <leader>gv :Gitv<cr>
nmap <silent> <leader>gV :Gitv --all<cr>

" Coc keybbindings
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


