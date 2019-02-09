" vim-fugitive
" Git integration

Plug 'tpope/vim-fugitive'

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :silent! Glog<cr>:bot copen<cr>
nnoremap <leader>gb :Gblame<cr>
