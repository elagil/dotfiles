#!/bin/bash
SCRIPT_PATH=$(readlink -f "${BASH_SOURCE:-$0}")
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

echo "Running from '$SCRIPT_DIR'."

LOCAL_BIN_DIR=~/.local/bin
mkdir -p $LOCAL_BIN_DIR

BIN_DIR=/usr/local/bin

# Install essential applications
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install\
    stow\
    fish\
    unzip\
    git\
    curl\
    build-essential\
    bat\
    fd-find\
    python3-venv\
    wl-clipboard

mkdir -p ~/.local/bin

# Create symlinks for configuration
stow ./.config -t ~ -v

# Create a symlink for bat
ln -s $(which batcat) ~/.local/bin/bat

# Create a symlink for fd
ln -s $(which fdfind) ~/.local/bin/fd

# Use fish as default shell
chsh -s $(which fish)

# Install fisher
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# Use FZF within fish, with practical key bindings
fish -c "fisher install PatrickF1/fzf.fish"

# Install a theme.
fish -c "fisher install oh-my-fish/theme-bobthefish"
