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

# catppuuccin/fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
