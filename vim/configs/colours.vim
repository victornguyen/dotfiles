" Colours

" Enable true color
set termguicolors

" Set escape codes to fix true color inside tmux
" See :h xterm-true-color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

syntax enable
set background=dark

" ~/.vimrc_background sets the colorscheme
" It is set by selecting a theme with base16-shell:
"   $ base16_<tab>
" When changing base16 themes, remember to set matching
" airline and fzf themes too...
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
