" NERD tree
" Filesystem explorer

Plug 'scrooloose/nerdtree'

nnoremap <silent> <leader>F :NERDTreeFind<CR> <C-w>=
nnoremap <silent> <leader>n :NERDTreeToggle<CR> <C-w>=

let NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeWinSize=36
let NERDTreeIgnore=['\.DS_Store$', '\~$', '\.sw[poq]$', '.git']

" Refresh tree when entering NERDTree window
function! NERDTreeRefresh()
  if &filetype == "nerdtree"
    silent exe substitute(mapcheck("R"), "<CR>", "", "")
  endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()
