# User-level instructions

- Never add Co-Authored-By lines, AI attribution, or "Generated with Claude" notes to commits, PRs, or any other artifacts.

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

## Communication
Never post messages on the user's behalf (PR comments, Slack messages, GitHub replies, etc.) unless explicitly asked to post. Always draft and confirm first.

## Git operations
Read-only git commands (status, log, diff, show) are fine.
Never add, commit, push, or any command that modifies history unless explicitly asked to.
