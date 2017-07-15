# base16 settings

THEME_ALIAS="base16_oceanicnext"

# Set a base16 theme if one hasn't previously been set
# base16-shell provides aliases to set shell themes:
#   $ base16_<tab>

# Setting a theme will write/update the following files:
#   ~/.base16_theme
#   ~/.vimrc_background
# The vim file is read in vim/config/colours.vim to set
# a matching base16 vim theme.

# TODO: learn how to script in zsh and do this properly
if [[ ! -f ~/.base16_theme ]]; then
  setopt aliases
  eval $THEME_ALIAS
fi
