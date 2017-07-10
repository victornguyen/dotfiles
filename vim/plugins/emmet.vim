" Emmet
" Expand abbreviations

Plug 'mattn/emmet-vim'

" Smart tab expansion only for certain filetypes
" https://github.com/mattn/emmet-vim/issues/232
let g:user_emmet_install_global = 0
autocmd FileType html,eruby,css,scss EmmetInstall
autocmd FileType html,eruby,css,scss imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
