# Dotfiles Repository

This repo contains my personal dotfiles managed with [GNU Stow](https://archlinux.org/packages/extra/any/stow/), a symlink farm manager that makes it easy to install and manage configuration files across multiple systems.

## Prerequisites

### Arch Linux
```bash
yay -S stow
```

### MacOS
```bash
brew install stow
```

## Install

```bash
git clone https://github.com/sabieber/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

This will [link](https://wiki.archlinux.de/title/Ln) the appropriate files in `.dotfiles` to the home directory. Everything is configured and tweaked within ~/.dotfiles.

## Whats Inside

Currently the following tools are configured:

* [kitty](https://github.com/kovidgoyal/kitty) - Cross-platform terminal emulator
* [WezTerm](https://wezfurlong.org/wezterm/index.html) - Cross-platform terminal emulator
* [git](https://git-scm.com/) - Including some helpful aliases for working with git-flow
