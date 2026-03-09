# User-level instructions

- Never add Co-Authored-By lines, AI attribution, or "Generated with Claude" notes to commits, PRs, or any other artifacts.
- When writing implementation plans for a bd issue, always write the entire plan to the bd issue itself (e.g., via `bd update <id> --design` or `--notes`) instead of creating a separate markdown file.

### Code Intelligence
Prefer LSP over Grep/Glob/Read for code navigation:
- `goToDefinition` / `goToImplementation` to jump to source
- `findReferences` to see all usages across the codebase
- `workspaceSymbol` to find where something is defined
- `documentSymbol` to list all symbols in a file
- `hover` for type info without reading the file
- `incomingCalls` / `outgoingCalls` for call hierarchy

Before renaming or changing a function signature, use `findReferences` to find all call sites first.

Use Grep/Glob only for text/pattern searches (comments, strings, config values) where LSP doesn't help.

After writing or editing code, check LSP diagnostics before moving on. Fix any type errors or missing imports immediately.

## Task Tracking — Beads
Use `bd` (Beads) for all task tracking. It's installed globally.
Each project uses stealth mode — data is local-only, nothing commits.

### Session start
Run `bd ready` to see open, unblocked tasks. Review open tasks and note dependencies before starting work.
If `bd ready` fails with "not initialized", run `bd init --stealth` first, then proceed.

Also check what's in progress:
  bd list --status in_progress # resume context

### During implementation
When you discover a task that can't be done right now, capture it immediately:
  bd create "Short description" -p <priority>   # p0=critical, p1=high, p2=normal, p3=low

Don't wait until end of session. Capture it the moment you notice it and let me know.

### Linking tasks
If a task blocks another:
  bd dep add <child-id> <parent-id>

### Updating status
  bd update <id> --status in_progress   # when starting

Always ask the user to verify the work before marking as done.

  bd update <id> --status done          # when user confirms it's done

### End of session
Before finishing, run `bd list` and create issues for anything outstanding that hasn't been captured yet.
Don't mark anything done until I've verified it.

### Never use `bd edit` — it opens an interactive editor. Use `bd update` with flags instead.

## Git operations
Read-only git commands (status, log, diff, show) are fine.
Never add, commit, push, or any command that modifies history unless explicitly asked to.
