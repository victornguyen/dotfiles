" ALE
" Asynchronous Lint Engine

Plug 'w0rp/ale'

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}
