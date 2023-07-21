#!/bin/bash
mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/fish

ln -sf $(pwd)/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf $(pwd)/ginit.vim ~/.config/nvim/ginit.vim
ln -sf $(pwd)/init.lua ~/.config/nvim/init.lua
ln -sf $(pwd)/vimrc.vim ~/.config/nvim/vimrc.vim
ln -sf $(pwd)/config.vim ~/.config/nvim/config.vim
ln -sf $(pwd)/update.vim ~/.config/nvim/update.vim
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/fish_variables ~/.config/fish/fish_variables

env DOTFILES_SETUP=1 nvim
