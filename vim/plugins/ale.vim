" ALE
" Asynchronous Lint Engine
" [l and ]l to navigate to previous and next lint warning/error

Plug 'w0rp/ale'

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}
