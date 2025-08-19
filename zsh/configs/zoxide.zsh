# zoxide
# A smarter cd command. Supports all major shells.
# https://github.com/ajeetdsouza/zoxide

# Initialize zoxide
eval "$(zoxide init zsh)"

# Replace cd with z for muscle memory (only in interactive shells)
if [[ $- == *i* ]]; then
  alias cd=z
fi

# Fix zi command conflict with zinit
unalias zi 2>/dev/null  # Remove zinit alias
alias zin=zinit         # Create new alias for zinit

# Enhanced directory jumping with fzf integration
# Jump if args provided, otherwise use fzf to filter zoxide results
j() {
  if [ $# -gt 0 ]; then
    z "$*"
  else
    local dir
    dir="$(zoxide query --list | fzf --no-sort +m)" && cd "${dir}" || return 1
  fi
}

# Browse and jump to subdirectories with fzf
k() {
  local dir
  dir="$(find . -maxdepth 1 -mindepth 1 -type d -not -path '*/.*' | fzf --no-sort +m)" && cd "${dir}" || return 1
}

# Enhanced file opening with fzf integration
# Uses fd to find files and opens with $EDITOR
f() {
  if [ $# -gt 0 ]; then
    # Find files matching the query and open with editor
    local file
    file="$(fd -t f "$*" | head -1)"
    if [ -n "$file" ]; then
      ${EDITOR:-vim} "$file"
    else
      echo "No file found matching: $*"
      return 1
    fi
  else
    # Use fzf to select from all files in current directory and subdirectories
    local file
    file="$(fd -t f | fzf -1 -0 --no-sort +m)" && ${EDITOR:-vim} "${file}" || return 1
  fi
}