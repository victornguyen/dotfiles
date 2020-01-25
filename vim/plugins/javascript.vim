" JavaScript
" Syntax highlighting, indentation, jsx support

Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" vim-javascript
let g:javascript_plugin_flow = 1
" Highlight object keys
" https://github.com/pangloss/vim-javascript/issues/138
hi def link jsObjectKey Label
