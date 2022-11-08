#!/bin/bash
set -x # activate debugging from here
SCRIPT_PATH=$(readlink -f "${BASH_SOURCE:-$0}")
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

echo "Running from '$SCRIPT_DIR'."

CONFIG_DIR=~/.config
LOCAL_BIN_DIR=~/.local/bin
mkdir -p $LOCAL_BIN_DIR

BIN_DIR=/usr/local/bin

# Install essential applications
sudo apt-get install\
    curl\
    build-essential\
    fd-find\
    ripgrep\
    fzf\
    python3-venv\
    wl-clipboard

sudo ln -s $(which fdfind) $BIN_DIR/fd

# Install NPM
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# lazygit
# Find out latest version
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest"\
    | grep '"tag_name":'\
    |  sed -E 's/.*"v*([^"]+)".*/\1/')

# Install it
curl -L "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"\
    | sudo tar xzf - -C $BIN_DIR lazygit

# Link configuration files and folders
CONFIGURATIONS="nvim toolchain lazygit"
for CONFIGURATION in $CONFIGURATIONS; do
    ln -s $SCRIPT_DIR/$CONFIGURATION $CONFIG_DIR/$CONFIGURATION
done

