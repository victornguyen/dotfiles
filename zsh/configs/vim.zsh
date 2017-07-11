# Easily open vim to current directory
# No arguments: `vim .`
# With arguments: acts like `vim`
v() {
  if [[ $# > 0 ]]; then
    vim $@
  else
    vim .
  fi
}

compdef v=vim
