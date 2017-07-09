" Emmet
" Expand abbreviations

Plug 'mattn/emmet-vim'

" smart tab expansion
" https://coderwall.com/p/_uhrxw/using-tab-key-as-abbreviation-expander-on-emmet-vim
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
