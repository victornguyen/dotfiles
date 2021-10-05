# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status -sb
  fi
}

# fbrd - Fuzzy Branch Delete
fbrd() {
  local branches branch
  branches=$(git branch --merged) &&
  branch=$(echo "$branches" | fzf +m) &&
    git branch -d $(echo "$branch" | sed "s/.* //") && fbrd
}
