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

# Source fasd
eval "$(fasd --init auto)"
