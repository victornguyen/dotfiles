" Convenience
" Stuff to make life easier. Mostly keybindings 🔑

" Quick escaping
inoremap jk <Esc>

" Disable Ex mode because I don't know what it is yet
nnoremap Q <Nop>

" Switching between last buffer
nnoremap <tab> :b#<CR>

" Select pasted text
nnoremap gp `[v`]

" Go to start/end of line
nnoremap <C-h> ^
vnoremap <C-h> ^
nnoremap <C-l> $
vnoremap <C-l> $

" Save and quit
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>

" Open, save, source vimrc
nnoremap <leader>vv :e $MYVIMRC<CR>
nnoremap <leader>vs :w<CR>:source $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

" Delete buffer
nnoremap <leader>d :bd<CR>

" Set `K` to open vim help to word under cursor
set keywordprg=":help"

" Copy relative path (src/foo.txt)
nnoremap <leader>cf :let @+=expand("%")<CR>

" Copy absolute path (/something/src/foo.txt)
nnoremap <leader>cF :let @+=expand("%:p")<CR>

" Copy filename (foo.txt)
nnoremap <leader>ct :let @+=expand("%:t")<CR>
