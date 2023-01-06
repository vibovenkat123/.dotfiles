#!/bin/zsh
dir=$HOME/.dotfiles
folders=("nvim" "zsh" "tmux")
pushd $dir
for folder in $folders
do 
   echo "stowing $folder"
   stow -D $folder
   stow $folder
done
popd

