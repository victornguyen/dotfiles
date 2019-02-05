" ALE
" Asynchronous Lint Engine
" [l and ]l to navigate to previous and next lint warning/error
" TODO: bind :ALEFix to something convenient
" TODO: decide if eslint should be "fixer"
" TODO: decide if you want to use g: here or b: in ftplugins

Plug 'w0rp/ale'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\}
