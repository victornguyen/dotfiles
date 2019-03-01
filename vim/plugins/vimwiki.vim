" vimwiki

Plug 'vimwiki/vimwiki'

" Enable word-wrapping for vimwiki files
au FileType vimwiki set textwidth=80

let wiki = {}
let wiki.path = '$HOME/Dropbox/vimwiki'
let wiki.path_html = '$HOME/Dropbox/vimwiki_html'
let wiki.nested_syntaxes = {'js': 'javascript', 'rb': 'ruby'}
let g:vimwiki_list = [wiki]

" Disable <tab> in insert mode so UltiSnips works in vimwiki
let g:vimwiki_table_mappings = 0
