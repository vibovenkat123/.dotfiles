#!/bin/sh
curl -sS https://starship.rs/install.sh | sh
sudo apt install neovim exa pyenv tmux
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

