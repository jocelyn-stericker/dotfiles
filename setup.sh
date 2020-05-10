#!/bin/bash
mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/fish

ln -sf $(pwd)/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf $(pwd)/ginit.vim ~/.config/nvim/ginit.vim
ln -sf $(pwd)/init.vim ~/.config/nvim/init.vim
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/fish_variables ~/.config/fish/fish_variables

nvim -c 'CocInstall -sync coc-yank coc-prettier coc-eslint coc-tsserver coc-json coc-html coc-css coc-rust-analyzer coc-lists coc-git | q'
nvim -c 'CocUpdateSync | q'
