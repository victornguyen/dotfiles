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
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>r :e!<CR>

" Set `K` to open vim help to word under cursor
set keywordprg=":help"
