#!/bin/sh
curl -sS https://starship.rs/install.sh | sh
sudo apt install neovim exa pyenv tmux
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

