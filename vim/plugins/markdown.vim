" Markdown
" Syntax highlighting and mappings for markdown
" ]] to jump to next header
" TODO: consider using lighter tpope version?

" Tabular
" Dependency of vim-markdown, and also aligning things by char
" https://github.com/godlygeek/tabular
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" TODO: do i actually use this?

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
