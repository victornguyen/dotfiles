# fasd
# Quick access to dirs, files. Like z but on steroids
# https://github.com/clvv/fasd

# Default aliases:
# alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i' # cd with interactive selection

# TODO: learn and doco inline word completion with f,<tab> etc
# TODO: is there a way to display full $HOME path as `~/`?
# TODO: hook fasd backend up with .viminfo

# Source fasd
eval "$(fasd --init auto)"

# TODO: when you learn zsh scripting, make this functions more DRY
# TODO: configure fzf to display a little nicer
# fasd & fzf change directory
# Jump if args, filter output of fasd using fzf if none
j() {
  [ $# -gt 0 ] && fasd_cd -d "$*" return
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# fasd & fzf open with $EDITOR
# Jump if args, filter if none
unalias f
f() {
  [ $# -gt 0 ] && fasd -f -e ${EDITOR} "$*" && return
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
}
