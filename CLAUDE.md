# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a macOS dotfiles repository containing personal development environment configurations. The repository is primarily focused on shell scripting, configuration management, and development tooling setup.

## Key Technologies and Tools

- **Shell Environment**: zsh with Oh My Zsh framework
- **Terminal Multiplexer**: tmux with custom configuration and plugins
- **Package Management**: Homebrew (Brewfile for declarative package management)
- **Editor**: Neovim with LazyVim configuration
- **Development Tools**:
  - Git with delta for better diffs
  - fzf for fuzzy finding with fd integration
  - ripgrep for fast text search
  - bat for enhanced file viewing
  - eza for better directory listings
  - zoxide for smart directory navigation

## Common Commands

### Package Management

- `brew bundle` - Install packages from Brewfile
- `brew bundle dump` - Update Brewfile with currently installed packages
- `brew bundle cleanup` - Remove packages not in Brewfile

### Development Environment

- `tmux` - Start terminal multiplexer session
- `split` - Custom tmux function to create 4-pane layout
- `nvim` - Launch Neovim editor
- `lazygit` - Launch Git TUI

### Shell Navigation and Search

- `z <directory>` - Jump to directory using zoxide
- `fd <pattern>` - Find files/directories
- `rg <pattern>` - Search text in files
- `fzf` - Interactive fuzzy finder
- `bat <file>` - View file with syntax highlighting

## Directory Structure

- **Configuration Files**: Dotfiles are stored in the root directory (`.zshrc`, `.tmux.conf`, etc.)
- **Scripts**: Custom scripts in `bin/` directory for various utilities
- **Application Configs**: Nested configs in `.config/` directory for various applications
- **Package Management**: `Brewfile` defines all system packages

## Development Workflow

1. Configuration changes are made directly to dotfiles in the repository root
2. Shell configuration is managed through `.zshrc` with modular sourcing
3. tmux configuration supports vim-style navigation and session management
4. Package dependencies are managed declaratively through Brewfile

## Key Configuration Features

- **Shell**: Auto-starts tmux, uses starship prompt, extensive aliases and functions
- **tmux**: Vim-aware pane navigation, session management, plugin ecosystem
- **fzf Integration**: Enhanced with fd for file finding and git integration
- **Development Tools**: Configured for modern development with syntax highlighting, fuzzy finding, and smart navigation

## File Organization

The repository follows a typical dotfiles structure where configuration files are stored at the root level and can be symlinked to the home directory. The setup assumes a macOS environment with Homebrew as the primary package manager.

