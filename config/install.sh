#!/bin/bash
SCRIPT_PATH=$(readlink -f "${BASH_SOURCE:-$0}")
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

echo "Running from '$SCRIPT_DIR'."

CONFIG_DIR=~/.config
LOCAL_BIN_DIR=~/.local/bin
mkdir -p $LOCAL_BIN_DIR
mkdir -p $CONFIG_DIR

BIN_DIR=/usr/local/bin

# Install essential applications
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install\
    fish\
    unzip\
    git\
    curl\
    build-essential\
    bat\
    fzf\
    fd-find\
    python3-venv\
    wl-clipboard

mkdir -p ~/.local/bin

# Create a symlink fot bat
ln -s $(which batcat) ~/.local/bin/bat

# Create a symlink for fd
ln -s $(which fdfind) ~/.local/bin/fd

# Use fish as default shell
chsh -s $(which fish)

# Install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Use FZF within fish, with practical key bindings
fisher install PatrickF1/fzf.fish

# Install a theme.
fisher install oh-my-fish/theme-bobthefish

# Link configuration files and folders
CONFIGURATIONS="nvim fish"
for CONFIGURATION in $CONFIGURATIONS; do
    NEW_LINK=$CONFIG_DIR/$CONFIGURATION

    if ! [ -L $NEW_LINK ]; then
        ln -s $SCRIPT_DIR/$CONFIGURATION $NEW_LINK
    else
        echo "Link '$NEW_LINK' already exists, skipping."
    fi
done

# Use vscode for git
git config --global merge.tool code
git config --global mergetool.code.cmd code -d
