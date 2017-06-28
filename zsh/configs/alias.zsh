# Handy aliases

# Vim
alias v="$EDITOR"
alias vi="$EDITOR"

# Moving around
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Directories
alias l="ls -lahp"
alias lt="ls -lahpt" # sorted by modified time (most recent first)
alias ltr="ls -lahptr" # most recent last
alias md='mkdir -p' # -p to create intermediate dirs if necessary

# Setup directory stacks
# http://zsh.sourceforge.net/Intro/intro_6.html
DIRSTACKSIZE=10
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# Re-run previous command with sudo
alias please='sudo $(fc -ln -1)'

# Tmuxinator
alias mux='tmuxinator'

# Run ag with ignore file
alias ag='ag --path-to-ignore=~/.agignore'
