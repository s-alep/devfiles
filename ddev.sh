#!/bin/bash

set -e  # Exit on error

sudo apt update && sudo apt install -y ripgrep tmux gcc

# Install nvim
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz
rm -rf  nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 nvim
sudo mv nvim /opt/
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
nvim -v

mv devfiles/nvim ~/.config
mv devfiles/.tmux.conf ~
