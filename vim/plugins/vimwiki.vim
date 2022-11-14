" vimwiki

Plug 'vimwiki/vimwiki'

" Enable word-wrapping for vimwiki files
au FileType vimwiki set textwidth=80

" Disable <tab> in insert mode so UltiSnips works in vimwiki
let g:vimwiki_table_mappings = 0

" Prevent vimwiki will only set set the filetype of markdown files in a wiki
" directory, not globally.
let g:vimwiki_global_ext = 0

" Main wiki
let wiki = {}
let wiki.name = 'General wiki'
let wiki.path = '$HOME/Dropbox/vimwiki'
let wiki.path_html = '$HOME/Dropbox/vimwiki_html'
let wiki.syntax = 'default'
let wiki.ext = '.wiki'
let wiki.nested_syntaxes = {'js': 'javascript', 'rb': 'ruby'}

" Dev wiki
let dev = {}
let dev.name = 'Dev wiki'
let dev.path = '$HOME/Dropbox/vimwiki/dev'
let dev.path_html = '$HOME/Dropbox/vimwiki/dev/_html'
let dev.syntax = 'markdown'
let dev.ext = '.md'
let dev.nested_syntaxes = {'js': 'javascript', 'go': 'go', 'sh': 'sh'}

" Work
let work = {}
let work.name = 'Work'
let work.path = '$HOME/Dropbox/vimwiki/work/work'
let work.path_html = '$HOME/Dropbox/vimwiki/work/work/_html'
let work.syntax = 'markdown'
let work.ext = '.md'
let work.nested_syntaxes = {'js': 'javascript', 'json': 'json', 'go': 'go', 'graphql': 'graphql'}

" Setup wikis
let g:vimwiki_list = [wiki, dev, work]
