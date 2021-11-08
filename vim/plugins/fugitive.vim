" vim-fugitive
" Git integration

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'    " Github support
Plug 'tommcdo/vim-fubitive' " Bitbucket support

nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gd :Git diff<cr>
nnoremap <leader>gS :Git<cr>
nnoremap <leader>G :Git status<cr>
nnoremap <leader>gr :0Gclog<cr>

" fzf-vim commands
nnoremap <leader>gs :GFiles?<cr>
nnoremap <leader>gl :BCommits!<cr>
