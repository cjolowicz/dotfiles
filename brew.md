# Homebrew packages

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Standard utilities

- bash
- coreutils
- findutils
- gawk
- gnu-sed
- gnu-tar
- grep
- m4
- make
- zlib

## Additional utilities

- ack
- git
- hub
- ispell
- moreutils
- pv
- rename
- ripgrep
- sqlite
- stow
- trash
- tree

## GnuPG

- gnupg
- pinentry-mac

```
gpg --full-generate-key  # 4096 bits
gpg --armor --export $key
```

## Fish

- fish

```
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
curl -L https://get.oh-my.fish | fish
omf install bobthefish
curl -L https://raw.githubusercontent.com/justinmayer/tacklebox/master/tools/install.fish | fish
```

## Python

- python
- pyenv

```
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python - --src git+https://github.com/mitsuhiko/pipsi.git#egg=pipsi
pip install tox-pyenv
pip install virtualfish
pip install importmagic epc  # for spacemacs
```

## Emacs

```
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git -C .emacs.d checkout develop
brew tap d12frosted/emacs-plus
```

- emacs-plus

```
ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/
brew tap caskroom/fonts
brew cask install font-source-code-pro
```

## Node.js

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
omf install nvm
nvm install eode
```

- yarn

```
npm install -g tern
npm install -g js-beautify
npm install -g eslint
yarn global add prettier
```

## Clang

- llvm
- clang-format
- rtags

```
brew services start rtags
```

## Miscellaneous

- cmake
- ctop
- fortune
- glances
- graphviz
- hugo
- pandoc
