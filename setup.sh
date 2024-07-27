#!/bin/bash
mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/fish
mkdir -p ~/.local
mkdir -p ~/.local/bin

ln -sf $(pwd)/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json
rm -f ~/.config/nvim/ginit.vim
rm -f ~/.config/nvim/vimrc.vim
ln -sf $(pwd)/init.lua ~/.config/nvim/init.lua
ln -sf $(pwd)/plugins.vim ~/.config/nvim/plugins.vim
ln -sf $(pwd)/config.vim ~/.config/nvim/config.vim
ln -sf $(pwd)/update.vim ~/.config/nvim/update.vim
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/fish_variables ~/.config/fish/fish_variables
ln -sf $(pwd)/nvim-remote ~/.local/bin/nvim-remote

env DOTFILES_SETUP=1 nvim
