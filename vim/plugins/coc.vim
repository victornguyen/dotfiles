" Conquer of Completion
" https://github.com/neoclide/coc.nvim

if executable("node")
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-css'
  \ ]

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gl :CocDiagnostics<CR>

" Rename
nmap <leader>R <Plug>(coc-rename)
nmap <leader>rn <Plug>(coc-rename)
