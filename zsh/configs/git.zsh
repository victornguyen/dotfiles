# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status -sb
  fi
}

# gwt - Fuzzy Git Worktree selector
# Browse worktrees with fzf and cd into the selected one
gwt() {
  local dir
  dir=$(git worktree list | fzf --height=40% --reverse | awk '{print $1}') &&
    cd "$dir"
}

# fbrd - Fuzzy Branch Delete
fbrd() {
  local branches branch
  branches=$(git branch --merged) &&
  branch=$(echo "$branches" | fzf +m) &&
    git branch -d $(echo "$branch" | sed "s/.* //") && fbrd
}
