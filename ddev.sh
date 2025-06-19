#!/bin/bash

rm -rf ~/.tmux
rm -rf devfiles
rm -rf ~/.tmux.conf
rm -rf ~/.config/nvim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/s-alep/devfiles.git
sed -i 's/\r$//' devfiles/.tmux.conf
cp devfiles/.tmux.conf ~
cp -r devfiles/nvim ~/.config

mkdir ~/.local/scripts
cp devfiles/module-sessionizer ~/.local/scripts

echo 'PATH="$PATH":"$HOME/.local/scripts/"' >> ~/.bashrc
echo 'bind '"'"'\C-f':'module-sessionizer\n'"'"'' >> ~/.bashrc
