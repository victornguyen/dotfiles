" Search config

set hlsearch   " highlight search terms
set incsearch  " show matching search results as typing
set ignorecase " case insensitive search by default
set smartcase  " override ignorecase when term contains uppercase char

" Search for visually highlighted text
vnoremap // y/<c-r>"<cr>

" Disable search highlighting until next search
nnoremap <leader><space> :noh<cr>

" Toggle highlighting for searches (in normal mode)
nnoremap <F2> :set hls!<cr>
