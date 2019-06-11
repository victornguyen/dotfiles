" JavaScript
" Syntax highlighting, indentation, jsx support

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" vim-javascript
let g:javascript_plugin_flow = 1
" Highlight object keys
" https://github.com/pangloss/vim-javascript/issues/138
hi def link jsObjectKey Label

" vim-jsx
let g:jsx_ext_required = 0
