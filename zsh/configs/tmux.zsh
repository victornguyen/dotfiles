# Show available tmux sessions
# Stolen from: https://jamesoff.net/2017/08/26/tmux-configuration.html
if [[ -z $TMUX ]]; then
  sessions=$( tmux ls 2> /dev/null | awk '! /attached/ { sub(":", "", $1); print $1; }' | xargs echo )
  if [[ ! -z $sessions ]]; then
    echo "==> Available tmux sessions: $sessions"
  fi
  unset sessions
fi
