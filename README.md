# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Install chezmoi

**Linux / macOS:**
```bash
curl -fsLS https://get.chezmoi.io | sh
```

**Windows:**

```powershell
winget install twpayne.chezmoi
```

## New machine setup

```bash
chezmoi init --apply https://github.com/opethef10/dotfiles.git
```

This clones the repo, applies templates, and writes all dotfiles into `$HOME` in one step.

If you want to review changes before they're written to disk:

```bash
chezmoi init https://github.com/opethef10/dotfiles.git
chezmoi diff
chezmoi apply
```

## Everyday workflow

**Edit a tracked file:**

```bash
chezmoi edit ~/.bashrc     # opens the source file in $EDITOR
chezmoi diff               # preview the change
chezmoi apply               # write it to ~/.bashrc
```

Or edit the live file directly, then pull the change into the source state:

```bash
vim ~/.bashrc
chezmoi re-add             # syncs all tracked files' content/perms from disk
# or, for a single file:
chezmoi add ~/.bashrc
```

**Track a new file:**

```bash
chezmoi add ~/.config/newtool/config
```

**Commit and push:**

```bash
chezmoi cd
git add -A
git commit -m "Update bashrc aliases"
git push
exit
```

**Pull changes made on another machine:**

```bash
chezmoi update      # git pull + chezmoi apply, in one step
```

## Useful commands

| Command | What it does |
|---|---|
| `chezmoi diff` | Preview changes before applying |
| `chezmoi apply` | Write source state to `$HOME` |
| `chezmoi status` | Short summary of pending changes |
| `chezmoi re-add` | Refresh source state from live files (content + permissions) |
| `chezmoi cd` | Open a shell in the source directory (`~/.local/share/chezmoi`) |
| `chezmoi edit <path>` | Edit a file's source version directly |
| `chezmoi target-path <src>` | Show what a source path maps to in `$HOME` |
| `chezmoi source-path <target>` | Show what a live path maps to in the source dir |
| `chezmoi doctor` | Diagnose config/environment issues |

## Notes

- File naming follows chezmoi's [attribute conventions](https://www.chezmoi.io/reference/target-types/) (`dot_` for leading dots, `private_`, `executable_`, etc).
