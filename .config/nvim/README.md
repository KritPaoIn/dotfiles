# Dotfiles

## Table of Contents
1. [Information](#information)
2. [How to use](#how-to-use)
3. [Dependencies](#dependencies)
    1. [brew](#brew)
    2. [fish](#fish)
    3. [lua](#lua)
    4. [python](#python)
    5. [javascript/typescript](#javascript)
    6. [rust](#rust)
    7. [vim](#vim)
    8. [bash](#bash)

## Information
Curated for personal use only

## How to use
Configurations can be made via the `config.yaml` file

```yaml
# default config
theme: ayu
icons:
  diagnostic:
    error: 
    warn: 
    info: 
    hint: ﯧ
```

## Dependencies

### brew <a name="brew" />
```sh
/bin/bash -c $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
```

---

### fish (shell) <a name="fish" />

```sh
brew install fish
```

##### fisher (package manager)
```sh
brew install fisher
```

##### starship (prompt)
```sh
brew install starship
```

##### bat (better cat)
```sh
brew install bat
```

##### universal-ctags (better ctags)
```
brew install universal-ctags
```

##### exa (better ls)
```sh
brew install exa
```

##### z (better cd)
```sh
fisher install z
```

##### fzf (fuzzy finder)
```sh
fisher install fzf
```

##### nvm (node version manager for fish)
```sh
fisher install nvm
```

---

### lua <a name="lua" />

##### luaver (version manager)
```sh
brew install luaver
```

##### luarocks (package manager)
```sh
brew install luarocks
```

##### stylua (code formatter)
```sh
brew install stylua
```

---

### python <a name="python" />

##### pyenv (version manager)
```sh
brew install pyenv
pyenv install 3.11-dev # choose version
```

##### pip (package manager)
```sh
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --force-reinstall
```
##### black (code formatter)
```sh
brew install black
```

##### pynvim (vim dependency)
```sh
pip install neovim
```
---

### javascript/typescript <a name="javascript" />
##### nvm (version manager)
```sh
brew install nvm
mkdir -p ~/.nvm
fisher install jorgebucaran/nvm.fish
```

##### node
```sh
nvm install node
```

##### typescript-language-server (lsp)
```sh
npm i -g typescript-language-server
```

##### prettier (formatter)
```sh
npm i -g prettier
```
---

### rust <a name="rust" />

##### rustup

```sh
brew install rustup-init
rustup-init
```

##### rust-analyzer (lsp)
```sh
brew install rust-analyzer
```
---

### vim <a name="vim" />
##### lsp
```sh
npm i -g vim-language-server
```
---

### bash <a name="bash" />
##### lsp
```sh
brew install bash-language-server
```
---
