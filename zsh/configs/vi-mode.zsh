# Enable vi-mode
bindkey -v

# Fix zsh cursor shape when inside tmux
# https://github.com/kovidgoyal/kitty/issues/715#issuecomment-403993100
function zle-keymap-select zle-line-init zle-line-finish
{
  case $KEYMAP in
      vicmd)      print -n '\033[1 q';; # block cursor
      viins|main) print -n '\033[5 q';; # line cursor
  esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
