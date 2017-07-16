# compinit with -D flag to prevent caching completions with
# a .zcompdump file to fix fzf dir completion:
# https://github.com/junegunn/fzf/issues/553
# https://stackoverflow.com/a/19313327
autoload -U compinit -D

## case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
