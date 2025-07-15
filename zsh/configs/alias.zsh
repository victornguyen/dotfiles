# Handy aliases

# Vim
alias vi="v" # runs v() in vim.zsh

# Opens nvim to file selected from fd | fzf
alias vs="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"

# Moving around
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Directory lists
# Use eza if available
if [[ -x "$(command -v eza)" ]]; then
  alias l="eza -la"             # long list
  alias lg="eza -la --git"      # include git status
  alias lt="eza -la -s=mod"     # most recent last
  alias ltr="eza -lar -s=mod"   # most recent first
  alias tree="eza -a -T -L=2"  # tree view
else
  alias l="ls -lahF"            # long list
  alias lt="ls -lahFtr"         # most recent last
  alias ltr="ls -lahFt"         # most recent first
fi

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Re-run previous command with sudo
alias please='sudo $(fc -ln -1)'

# Lazygit
alias lz='lazygit'

# Make kitty cursor blink work in nvim while in tmux
alias nvim="TERM=xterm-kitty nvim"
