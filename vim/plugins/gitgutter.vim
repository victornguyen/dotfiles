" vim-gitgutter
" Add signs for file git status to gutter, stage hunks like a boss
" ]c and [c to navigate hunks/changes
" :GitGutterQuickFix to load hunks into quickfix list
" TODO: add bind for ☝️
" TODO: setting to open quickfix list when invoking?

Plug 'airblade/vim-gitgutter'

" Jump to hunk
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

" Update gutter on save
autocmd BufWritePost * GitGutter

" For more speed (enable if you keep seeing more lag)
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
