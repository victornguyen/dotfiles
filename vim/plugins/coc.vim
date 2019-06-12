" Conquer of Completion
" https://github.com/neoclide/coc.nvim

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

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

" Jump to definition
nmap <silent> gd <Plug>(coc-definition)
