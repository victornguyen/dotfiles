" gitgutter
" Add signs for file git status to gutter
" ]c to jump to next change

Plug 'airblade/vim-gitgutter'

" Disable default keymaps (so I can use <leader>h)
let g:gitgutter_map_keys = 0

" Jump to hunk
nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

" Update gutter on save
autocmd BufWritePost * GitGutter

" For more speed (enable if you keep seeing more lag)
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0


