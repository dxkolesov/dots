# My dotfiles

This directory contains the dofiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
brew install git
```

### Stow

```
brew install stow
```

## Installation

First, check out the '.dots/public' repo in your $HOME directory using git

```
cd .dots/public
git clone https://github.com/dxkolesov/dots.git .
```

then use GNU stow to create symlinks

```
stow --target=$HOME .
```
