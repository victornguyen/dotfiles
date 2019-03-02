" vim-fugitive
" Git integration

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'    " Github support
Plug 'tommcdo/vim-fubitive' " Bitbucket support

nnoremap <leader>gb :Gblame<cr>

" fzf-vim commands
nnoremap <leader>gs :GFiles?<cr>
nnoremap <leader>gl :BCommits<cr>
