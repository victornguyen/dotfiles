# fzf config

# Source fzf key bindings and completion
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

if [[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

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

# kanagawa-dragon/fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#282727,bg:#181616,spinner:#c8c093,hl:#c4746e \
--color=fg:#c5c9c5,header:#c4746e,info:#8992a7,pointer:#c8c093 \
--color=marker:#87a987,fg+:#c5c9c5,prompt:#658594,hl+:#c4746e"
