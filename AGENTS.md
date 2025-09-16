# AGENTS.md - Development Guidelines

## Build/Lint/Test Commands

- **Shell scripts**: `shellcheck *.sh bin/*.sh` (check syntax and style)
- **Lua**: `stylua --check .` (format check) or `stylua .` (format)
- **Package install**: `brew bundle` (install from Brewfile)
- **Symlink setup**: `stow --target=$HOME .` (create symlinks)

## Code Style Guidelines

### Shell Scripts

- Use `#!/bin/bash` or `#!/bin/zsh` shebangs
- Add `shellcheck shell=sh` comments for zsh scripts
- Use `local` for function variables
- Error handling: `command -v tool &>/dev/null` for existence checks
- Functions: lowercase with underscores, descriptive names
- Quotes: double quotes for variables, single for literals

### Lua (Neovim config)

- 2-space indentation, 120 column width (stylua)
- Table formatting: consistent alignment
- Comments: descriptive, avoid redundancy
- Naming: camelCase for variables, PascalCase for modules

### General

- No trailing whitespace
- Use descriptive variable/function names
- Consistent formatting across similar files
- Test scripts manually before committing

## Repository Structure

See CLAUDE.md for detailed repository overview and common commands.
