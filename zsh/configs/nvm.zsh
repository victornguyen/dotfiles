# Load nvm
# https://github.com/creationix/nvm

export NVM_DIR="$HOME/.nvm"

# nvm sloooows down shell load time
# Do not load nvm until first node/npm/nvm invocation
# https://github.com/creationix/nvm/issues/1277#issuecomment-455809893
nvm_load () {
  . $NVM_DIR/nvm.sh
  . $NVM_DIR/bash_completion
}

alias node='unalias nvm; unalias node; unalias npm; nvm_load; node $@'
alias npm='unalias nvm; unalias node; unalias npm; nvm_load; npm $@'
alias nvm='unalias nvm; unalias node; unalias npm; nvm_load; nvm $@'
