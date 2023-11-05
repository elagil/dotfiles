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
    ripgrep\
    fzf\
    python3-venv\
    wl-clipboard

# Use fish as default shell
chsh -s $(which fish)

# Install oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

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
