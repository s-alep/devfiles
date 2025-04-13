#!/bin/bash

set -e  # Exit on error

sudo apt update && apt install -y ripgrep tmux

# Install nvim
cd ~
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz
rm -rf  nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 nvim
sudo mv nvim /opt/
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
nvim -v 

cd ~/devfiles
mv nvim .config
mv .tmux.conf ~
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm




