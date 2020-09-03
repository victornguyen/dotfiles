" JSDoc generator
" https://github.com/heavenshell/vim-jsdoc
" :JsDoc

Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}

let g:jsdoc_enable_es6 = 1
let g:jsdoc_param_description_separator = ' - '
