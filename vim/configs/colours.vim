" Colours

syntax enable
set background=dark
set t_Co=256  " enable 256 colours

" ~/.vimrc_background sets the colorscheme
" It is set by selecting a theme with base16-shell:
"   $ base16_<tab>
" When changing base16 themes, remember to set matching
" airline and fzf themes too...
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
