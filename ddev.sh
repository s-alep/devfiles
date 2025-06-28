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

cp devfiles/module-sessionizer ~
chmod 777 ~/module-sessionizer

echo 'PATH="$PATH:$HOME"' >> ~/.bashrc
echo "bind -x '\"\C-f\":\"module-sessionizer\"'" >> ~/.bashrc
echo "alias v=nvim" >> ~/.bashrc
