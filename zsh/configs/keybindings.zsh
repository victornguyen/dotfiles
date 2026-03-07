# Handy key bindings

# Move around command line
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-char
bindkey "^b" backward-char
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^y" accept-and-hold
bindkey "^p" up-line-or-history
bindkey "^n" down-line-or-history
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line

# Open current command in editor
# CTRL+x,CTRL+e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line
