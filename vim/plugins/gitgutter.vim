" vim-gitgutter
" Add signs for file git status to gutter, stage hunks like a boss
" ]c and [c to navigate hunks/changes
" <leader>hq to load hunks in quickfix list

Plug 'airblade/vim-gitgutter'

" Jump to hunk
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

" Load hunks in quickfix list
nmap <leader>hq :GitGutterQuickFix<CR>

" Update gutter on save
autocmd BufWritePost * GitGutter

" For more speed (enable if you keep seeing more lag)
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
