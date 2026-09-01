# dotfiles 🏡

An evolving collection of little bits that make a computer feel like home. I spend too much time tweaking these.

### Installation
These are made for OSX:

```sh
git clone https://github.com/victornguyen/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./scripts/install
```

`install` runs several other scripts in `scripts/`, which can also be run independently.

### What's in them?
Things I've stolen across the Internet that primarily setup my shell (zsh), editor (vim) and multiplexer (tmux). Will expand on this later!

### Not covered by `scripts/install`
A few tools are installed by neither Homebrew nor mise and need a manual
step on a new machine:

- **Claude Code** — lives in `~/.local/bin/claude`
- **`@tobilu/qmd`** — a bun global: `bun add -g @tobilu/qmd`
- **Docker engine** — the Brewfile declares the `docker` CLI only. Install
  Docker Desktop, OrbStack or colima separately.

### Keeping the Brewfile honest
`scripts/brew-drift` compares `homebrew/Brewfile` against what is actually
installed, in both directions, and runs automatically on `git push`.
Anything installed but deliberately undeclared belongs in
`homebrew/.brewignore`.
