# Log (MacOS Big Sur)

## OS Installation

- Region: Germany
- Languages: English (Germany), German
- FileVault: Enable
- Location Services: Enable
- Telemetry: Disable
- Siri: Disable

## System Preferences

- System > Keyboard > Keyboard > Modifier Keys > Caps Lock Key > Escape
- System > Keyboard > Keyboard > Key Repeat > Fast
- System > Keyboard > Keyboard > Delay Until Repeat > Short
- System > Dock > Automatically hide and show the Dock
- System > Spaces > Disable: Automatically rearrange based on recent use

## Restore

- Finder: Copy Backup/Users/cjolowicz/Code to home directory

```sh
cp -va Backup/Users/cjolowicz/.ssh .
cp -va Backup/Users/cjolowicz/.gnupg .
```

## Installations

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask iterm2
brew install git
brew install bash
brew install bash-completion
brew install --cask docker
brew install --cask dropbox
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
brew tap d12frosted/emacs-plus
brew install emacs-plus@28 --with-spacemacs-icon
ln -s /usr/local/opt/emacs-plus@28/Emacs.app /Applications
brew tap homebrew/cask-fonts
brew install svn  # install dep for font-source-code-pro
brew install --cask font-source-code-pro
brew install pyenv
brew install zlib  # already installed: openssl readline sqlite3 xz
pyenv install 3.9.6
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
pipx install black
pipx install build
pipx install mypy
pipx install flake8
pipx install nox
pipx inject nox nox-poetry
pipx install tox
pipx install twine
pipx install virtualenv
pipx install isort
pipx install pre-commit
pipx install pytest
pipx install python-lsp-server
pipx inject python-lsp-server pyls-isort
pipx inject python-lsp-server pyls-mypy
pipx inject python-lsp-server pyls-black
pipx inject python-lsp-server pyls-memestra
pipx install autoflake
python3 -m pip install --user importmagic epc
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
brew install llvm
brew install cmake
brew install starship
brew install font-hack-nerd-font
```

## User configuration

```sh
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

## iTerm

- Font: Hack Nerd Font 13p
- Hide scrollbars
