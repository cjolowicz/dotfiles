# macos

## Shell

```sh
# Base
xcode-select --install  # it was already installed
ssh-keygen -t rsa -b 4096 -C $EMAIL
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git

# Standard utilities
brew install bash
brew install coreutils
brew install findutils
brew install gawk
brew install gnu-sed
brew install gnu-tar
brew install grep
brew install m4
brew install make
brew install zlib

# Additional utilities
brew install ack
brew install hub
brew install ispell
brew install moreutils
brew install pv
brew install rename
brew install stow
brew install sqlite
brew install tree

# GnuPG
brew install gnupg
brew install pinentry-mac
gpg --full-generate-key  # 4096 bits
gpg --armor --export $key

# Fish
brew install fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
curl -L https://get.oh-my.fish | fish
omf install bobthefish
curl -L https://raw.githubusercontent.com/justinmayer/tacklebox/master/tools/install.fish | fish

# Python
brew install python
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python - --src git+https://github.com/mitsuhiko/pipsi.git#egg=pipsi
brew install pyenv
pip install tox-pyenv
pip install virtualfish

# Emacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
brew install emacs
#brew services start emacs  # GPG_TTY unset on startup

# dotfiles
git clone git@github.com:cjolowicz/dotfiles.git ~/.dotfiles
source ~/.dotfiles/fish/.config/fish/functions/dotfiles.fish
dotfiles fish
```

## Apps

- iTerm2
- Raindrop.io
- Docker

## Preferences

- System > Security & Privacy > Privacy > Accessibility > + > iTerm
- iTerm2 > Appearance > Tabs > Show tab bar in fullscreen > no
- iTerm2 > Profiles > + > Original
- iTerm2 > Profiles > Default > Keys > Left Option acts as Esc+
- iTerm2 > Profiles > Default > Text > Font > Change Font > Hack Nerd Font Regular 13pt
- iTerm2 > Profiles > Default > Text > Font > Use a different font for non-ASCII text > Hack Nerd Font Regular 13pt
