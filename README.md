# dotfiles 🏡

An evolving collection of little bits that make a computer feel like home. I spend too much time tweaking these.

### Installation
These are made for OSX.

Clone over HTTPS. `ssh/config` points `IdentityAgent` at 1Password's agent
socket, which does not exist on a machine that has not been set up yet.

```sh
git clone https://github.com/victornguyen/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./scripts/install
```

`install` runs the other scripts in `scripts/` in order, each of which can
also be run independently. Restart your shell when it finishes.

**Before your first commit**, open 1Password — the Brewfile installs it, but
it cannot sign you in — and turn on *Settings → Developer → Use the SSH agent*.
`git/gitconfig` sets `commit.gpgsign` and signs through `op-ssh-sign`, so every
commit fails until that is done.

### What's in them?
Things I've stolen across the Internet that primarily setup my shell (zsh), editor (vim) and multiplexer (tmux). Will expand on this later!

### Not covered by `scripts/install`
A few tools are installed by neither Homebrew nor mise and need a manual
step on a new machine:

- **Claude Code** — lives in `~/.local/bin/claude`
- **`@tobilu/qmd`** — a bun global: `bun add -g @tobilu/qmd`. Bun itself comes
  from mise, so only the package is manual.

  Note that `bun add -g` links global binaries into `~/.bun/bin`, which
  `zsh/zshrc` puts at the *front* of PATH — ahead of the mise shims. That is
  needed for qmd, but it means a `bun` or `bunx` left in that directory by
  bun's own curl installer will shadow the mise-managed one. Delete those two
  and keep the directory.
- **Docker engine** — the Brewfile declares the `docker` CLI only. Install
  Docker Desktop, OrbStack or colima separately.

### Machine-specific git settings
`~/.gitconfig-local` is the override point — a work email, a work signing key,
anything this machine needs to differ on. It is not tracked, and git ignores it
silently when absent. The `[include]` that pulls it in sits at the very end of
`git/gitconfig` on purpose: git resolves last-wins, so anything below the
include could not be overridden.

```gitconfig
# ~/.gitconfig-local on a work machine
[user]
  email = you@work.example
  signingkey = ssh-ed25519 AAAA...
```

Commits are signed with the SSH key held in 1Password ("SSH - Personal"),
which requires *Settings → Developer → Use the SSH agent* to be enabled.
`ssh/config` points `IdentityAgent` at the agent socket; its `Include` sits at
the **top** of that file because ssh is first-match-wins, the opposite of git.

`git/allowed_signers` holds the public keys trusted to sign, so signatures can
actually be verified. Public keys are not secret — the file is tracked
deliberately.

### Machine-local files
Not tracked, and each falls back silently when absent — so a fresh machine
works, but points somewhere wrong until they are recreated:

- `nvim/lua/vic/local.lua` — `wiki_path` for obsidian.nvim. Without it the
  vault falls back to `~/wiki` with no warning.
- `~/.vimwiki_local.lua` — same idea for vimwiki, which otherwise defaults to
  `$HOME/Dropbox/vimwiki/{me,work}`.
- `~/.zshrc.local` and `~/.zshenv.local` — sourced at the end of each if present.

### Keeping the Brewfile honest
`scripts/brew-drift` compares `homebrew/Brewfile` against what is actually
installed, in both directions, and runs automatically on `git push`. There
is no exceptions list: if it reports drift, either declare the package or
remove it from the machine.

Mac App Store apps are not checked — neither brew nor `mas` can uninstall
them, so undeclared ones would be drift with no way to resolve it.
