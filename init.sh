#!/bin/bash

set -e  # Exit on error

apt update && apt install -y \
    ninja-build gettext cmake unzip curl git build-essential python3 python3-pip ripgrep tmux

CMAKE_VERSION=3.16.9
cd /usr/local/src
curl -LO https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION-Linux-x86_64.sh
chmod +x cmake-$CMAKE_VERSION-Linux-x86_64.sh
./cmake-$CMAKE_VERSION-Linux-x86_64.sh --skip-license --prefix=/usr/local
rm cmake-$CMAKE_VERSION-Linux-x86_64.sh

cmake --version

git clone https://github.com/neovim/neovim.git --depth=1 /usr/local/src/neovim
cd /usr/local/src/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo

make install

curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs

pip install debugpy

mkdir -p ~/.config
echo '1'
export TERM=xterm-256color

echo '2'
mkdir -p ~/.terminfo/t

echo '3'
cat << 'EOF' > ~/.terminfo/t/tmux-256color.terminfo
tmux-256color|tmux with 256 colors,
  use=xterm-256color,
EOF

echo '4'
tic ~/.terminfo/t/tmux-256color.terminfo

echo '5'
cd /root
sed -i 's/\r$//' devfiles/.tmux.conf
sed -i 's/\r$//' devfiles/.bashrc

echo '6'
mv devfiles/nvim ~/.config/
echo '7'
mv devfiles/.tmux.conf ~
echo '8'
rm /root/.bashrc
echo '8'
mv devfiles/.bashrc ~
echo '9'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo '10'

nvim --version
node -v
npm -v
