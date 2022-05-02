#!/bin/bash

## Symlink
if [ ! -z $HOME ]; then
    mkdir -p $HOME/.config/
    ln -sF $HOME/.dotfiles/.config/nvim $HOME/.config
    ln -sF $HOME/.dotfiles/.config/fish $HOME/.config
    ln -sF $HOME/.dotfiles/.tmux.conf $HOME
    ln -sF $HOME/.dotfiles/.tmux $HOME
    ln -sF $HOME/.dotfiles/.gitconfig $HOME
fi

## Dependencies

### brew
/bin/bash -c $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)

### fish (shell)
brew install fish

### bash-language-server (lsp)
brew install bash-language-server

#### fisher (package manager)
brew install fisher

#### starship (prompt)
brew install starship

#### bat (better cat)
brew install bat

#### universal-ctags (better ctags)
brew install universal-ctags

#### exa (better ls)
brew install exa

#### z (better cd)
fisher install z

#### fzf (fuzzy finder)
fisher install fzf

#### nvm (node version manager for fish)
fisher install nvm

### neovim
brew install neovim

#### vim-language-server (lsp)
npm i -g vim-language-server

### lua

#### luaver (version manager)
brew install luaver

#### luarocks (package manager)
brew install luarocks

#### stylua (code formatter)
brew install stylua

#### lyaml (yaml parser)
luarocks install lyaml

### python

#### pyenv (version manager)
brew install pyenv
pyenv install 3.11-dev # choose version

#### pip (package manager)
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --force-reinstall

#### black (code formatter)
brew install black

#### pynvim (vim dependency)
pip install neovim

### javascript/typescript
brew install nvm
mkdir -p ~/.nvm
fisher install jorgebucaran/nvm.fish

#### node
nvm install node

#### typescript-language-server (lsp)
npm i -g typescript-language-server

#### prettier (formatter)
npm i -g prettier

#### cloudflared (web hoster)
brew install cloudflared

### rust

#### rustup
brew install rustup-init
rustup-init

#### rust-analyzer (lsp)
brew install rust-analyzer

