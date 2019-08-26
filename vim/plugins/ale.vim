" ALE
" Asynchronous Lint Engine
" [l and ]l to navigate to previous and next lint warning/error
" TODO: bind :ALEFix to something convenient
" TODO: decide if you want to use g: here or b: in ftplugins

Plug 'w0rp/ale'

" Replace arg navigation with ale navigation
nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" let g:ale_sign_error = '✘'
let g:ale_sign_warning = ''
let g:ale_sign_info = ''
" let g:ale_sign_style_error = '✘'
let g:ale_sign_style_warning = ''

let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['tslint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': ['prettier'],
\}
