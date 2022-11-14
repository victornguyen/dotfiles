# fzf config

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set ripgrep as the default source for fzf
# --files: print each file to be searched
# --hidden: search hidden files and directories
# --glob: ignore .git/ directories
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'

# Apply the default fzf command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Helper for bind-git-helper()
join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

# Bind keys g[x] to fzf-g[x]-widget in zsh
bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper f b
unset -f bind-git-helper

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#c0caf5,bg:#24283b,hl:#f7768e --color=fg+:#73daca,bg+:#33467c,hl+:#f7768e --color=info:#73daca,prompt:#bb9af7,pointer:#73daca --color=marker:#c0caf5,spinner:#73daca,header:#7aa2f7'

# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
# --color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
# --color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
# --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
# --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'
