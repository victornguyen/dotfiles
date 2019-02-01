# Handy key bindings

# Move around command line
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-char
bindkey "^b" backward-char
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line

# Open current command in Vim
# CTRL+x,CTRL+e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

# Accept zsh-autosuggestion suggestion
# CTRL+<Space>
bindkey "^ " autosuggest-accept
