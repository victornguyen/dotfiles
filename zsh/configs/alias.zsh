# Handy aliases

# Vim
alias vi="v"

# Moving around
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Directory lists
# Use exa if available
if [[ -x "$(command -v exa)" ]]; then
  alias l="exa -la"             # long list
  alias lg="exa -la --git"      # include git status
  alias lt="exa -la -s=mod"     # most recent last
  alias ltr="exa -lar -s=mod"   # most recent first
  alias ltree="exa -a -T -L=2"  # tree view
else
  alias l="ls -lahF"            # long list
  alias lt="ls -lahFtr"         # most recent last
  alias ltr="ls -lahFt"         # most recent first
fi

# Directory stacks
# http://zsh.sourceforge.net/Intro/intro_6.html
DIRSTACKSIZE=10
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# TODO: do we still need these with fasd now?
alias dd='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Re-run previous command with sudo
alias please='sudo $(fc -ln -1)'

# Run ag with ignore file
alias ag='ag --path-to-ignore=~/.agignore'
