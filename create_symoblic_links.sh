#!/bin/bash

ln -sf ~/dotfiles/.zshrc ~/.
ln -sf ~/dotfiles/.vimrc ~/.

(mkdir ~/.config/alacritty)

ln -sf ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/
