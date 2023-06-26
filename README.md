# Bootstrap

## Settings
- [macos](macos.md)

## Homebrew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install iterm2
brew install bash
echo /opt/homebrew/bin/bash | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/bash
```
- [brew](brew.md)

## Dotfiles
```sh
for dir in .gnupg .ssh .gitconfig.d .profile.private
do
    scp -r $oldhost:$dir .
done

git clone https://github.com/cjolowicz/dotfiles.git Code/github.com/cjolowicz/dotfiles
. Code/github.com/cjolowicz/dotfiles/bash/.bashrc

dotfiles bash
dotfiles git
dotfiles gnupg
dotfiles ssh
```

## Scripts
```sh
git clone https://github.com/cjolowicz/scripts.git Code/github.com/cjolowicz/scripts
cd Code/github.com/cjolowicz/scripts
util/install-script.sh util/install-script.sh
install-script admin/update.sh
install-script admin/macos-alias.sh
```

## Emacs
- [brew](brew.md)
```sh
macos-alias /opt/homebrew/opt/emacs-plus@28/Emacs.app /Applications
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
dotfiles spacemacs
```
