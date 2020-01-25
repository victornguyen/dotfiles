" Conquer of Completion
" https://github.com/neoclide/coc.nvim
" :CocInstall coc-tsserver coc-json coc-css
" TODO: automate this somehow
" TODO: try this: https://github.com/neoclide/coc.nvim/issues/118

if executable("node")
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Binds
nmap <silent> gd <Plug>(coc-definition)
" TODO: want to bind gs here, but it's bound to vim-sort-motion... figure out
" if we need it?
nmap <silent> ge :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <leader>R <Plug>(coc-rename)
