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
    fd-find\
    ripgrep\
    fzf\
    python3-venv\
    wl-clipboard

# Use fish as default shell
chsh -s $(which fish) 

# Install oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

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
    NEW_LINK=$CONFIG_DIR/$CONFIGURATION

    if ! [ -L $NEW_LINK ]; then
        ln -s $SCRIPT_DIR/$CONFIGURATION $NEW_LINK
    else
        echo "Link '$NEW_LINK' already exists, skipping."
    fi
done

# Use nvim for git
git config --global merge.tool nvim
git config --global mergetool.nvim.cmd nvim -d
