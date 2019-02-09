" vim-fugitive
" Git integration

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'    " Github support
Plug 'tommcdo/vim-fubitive' " Bitbucket support

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :silent! Glog<cr>:bot copen<cr>
nnoremap <leader>gb :Gblame<cr>
