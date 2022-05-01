#!/bin/bash

if [ ! -z $HOME ]; then
    mkdir -p $HOME/.config/
    ln -sF $HOME/.dotfiles/.config/nvim $HOME/.config/nvim
    ln -sF $HOME/.dotfiles/.config/fish $HOME/.config/fish
    ln -sF $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
    ln -sF $HOME/.dotfiles/.tmux $HOME/.tmux
    ln -sF $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
fi
