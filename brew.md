# brew

```sh
# Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Bash.
brew install bash
brew install bash-completion
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
# restart shell

# GNU utilities.
brew install coreutils
brew install findutils
brew install gawk
brew install gnu-tar
brew install gnu-sed  # already installed
brew install grep

# Cryptography.
brew install openssl
brew install gnupg
brew install pinentry-mac

# Modern utilities.
brew install stow
brew install tree
brew install ripgrep
brew install exa
brew install bat
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install diff-so-fancy
brew install starship
brew install glances
brew install entr
brew install vivid
brew install dust
brew install fd
brew install tavianator/tap/bfs

# Libraries.
brew install zlib
brew install readline  # already installed
brew install sqlite3  # already installed
brew install xz  # already installed

# Developer tools.
brew install git
brew install git-extras
brew install libgit2
brew install icdiff
brew install svn  # install dep for font-source-code-pro
brew install mercurial
brew install github/gh/gh
brew install python@3.{10,9,8,7}
brew install go
brew install ruby
brew install make
brew install llvm
brew install cmake
brew install jq
brew install pandoc
brew install asciidoctor
brew install direnv

# Fonts.
brew tap homebrew/cask-fonts
brew install --cask font-source-code-pro
brew install font-hack-nerd-font

# Emacs.
brew tap d12frosted/emacs-plus
brew install emacs-plus@29 --with-spacemacs-icon
ln -s /usr/local/opt/emacs-plus@29/Emacs.app /Applications
brew services start d12frosted/emacs-plus/emacs-plus@29
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Applications.
brew install iterm2
brew install docker
brew install dropbox
brew install slack
brew install zoom
brew install google-chrome
brew install firefox
brew install qutebrowser
# https://github.com/qutebrowser/qutebrowser/issues/6771
sudo xattr -rd com.apple.quarantine /Applications/qutebrowser.app
brew install openvpn
sudo brew services start openvpn
brew install spotify
brew install signal
brew install virtualbox
brew install evernote

# Python.
brew install pipx
brew install miniconda
conda install mamba -n base -c conda-forge
conda update -n base -c defaults conda
```
