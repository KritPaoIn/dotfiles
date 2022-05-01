#!/bin/bash

if [ ! -z $HOME ]; then
    mkdir -p $HOME/.config/
    ln -sF $HOME/.dotfiles/.config/nvim $HOME/.config
    ln -sF $HOME/.dotfiles/.config/fish $HOME/.config
    ln -sF $HOME/.dotfiles/.tmux.conf $HOME
    ln -sF $HOME/.dotfiles/.tmux $HOME
    ln -sF $HOME/.dotfiles/.gitconfig $HOME
fi
