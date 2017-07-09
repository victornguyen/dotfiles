" Convenience
" Stuff to make life easier. Mostly keybindings 🔑

" Quick escaping
inoremap jk <Esc>

" Switching between last buffer
nnoremap <tab> :b#<CR>

" Select pasted text
nnoremap gp `[v`]

" Save and quit
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>

" Open, save, source vimrc
nnoremap <leader>vv :e $MYVIMRC<CR>
nnoremap <leader>vs :w<CR>:source $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

" Buffers (navigation, delete, reload)
nnoremap <leader>k :bn<CR>
nnoremap <leader>j :bp<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>r :e!<CR>
