" vimwiki

Plug 'vimwiki/vimwiki'

" Enable word-wrapping for vimwiki files
au FileType vimwiki set textwidth=80

" vimwiki
let wiki = {}
let wiki.path = '$HOME/Dropbox/vimwiki'
let wiki.path_html = '$HOME/Dropbox/vimwiki_html'
let wiki.nested_syntaxes = {'js': 'javascript', 'rb': 'ruby'}
let g:vimwiki_list = [wiki]
