# brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask iterm2
brew install git
brew install bash
brew install bash-completion
brew install --cask docker
brew install --cask dropbox
brew tap d12frosted/emacs-plus
brew install emacs-plus@28 --with-spacemacs-icon
ln -s /usr/local/opt/emacs-plus@28/Emacs.app /Applications
brew tap homebrew/cask-fonts
brew install svn  # install dep for font-source-code-pro
brew install --cask font-source-code-pro
brew install zlib  # already installed: openssl readline sqlite3 xz
brew install ripgrep
brew install github/gh/gh
brew install tree
brew install coreutils
brew install findutils
brew install gawk
brew install gnu-tar  # already installed: gnu-sed
brew install gnupg
brew install grep
brew install make
brew install pinentry-mac
brew install pipx
brew install llvm
brew install cmake
brew install starship
brew install font-hack-nerd-font
brew install slack
brew install zoom
brew install glances
brew install mercurial
brew install qutebrowser
brew install exa
brew install bat
brew install fzf
brew install miniconda
brew install diff-so-fancy
```

```sh
$(brew --prefix)/opt/fzf/install
```
