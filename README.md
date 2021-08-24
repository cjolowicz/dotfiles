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
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
brew install zlib  # already installed: openssl readline sqlite3 xz
pyenv install 3.9.6
brew install ripgrep
brew install github/gh/gh
brew install tree
```

## User configuration

```sh
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

## iTerm

- Font: Source Code Pro 13p
- Hide scrollbars
