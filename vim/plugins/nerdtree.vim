" NERD tree
" Filesystem explorer

Plug 'scrooloose/nerdtree'

nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>F :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeWinSize=40
let NERDTreeIgnore=['\.DS_Store$', '\~$', '\.sw[poq]$', '.git']
