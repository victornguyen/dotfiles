# Easily open neovim to current directory
# No arguments: `nvim .`
# With arguments: acts like `nvim`
v() {
  if [[ $# > 0 ]]; then
    nvim $@
  else
    nvim .
  fi
}

compdef v=nvim
