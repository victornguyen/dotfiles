" Ag
" Vim plugin for the_silver_searcher
" TODO: deprecated? https://github.com/rking/ag.vim

Plug 'rking/ag.vim'

nnoremap <leader>ag :Ag!<space>
nnoremap <leader>as :AgFromSearch!<cr>
nnoremap <leader>ab :AgBuffer!<cr>

" Ag for visually selected text
vnoremap /s y/<c-r>"<cr>:AgFromSearch<cr>
