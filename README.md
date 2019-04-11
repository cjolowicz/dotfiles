# dotfiles

This is my collection of dotfiles.

Bootstrap using fish:

```fish
brew install stow  # install dependency
git clone https://github.com/cjolowicz/dotfiles.git ~/.dotfiles
source ~/.dotfiles/fish/.config/fish/functions/dotfiles.fish
dotfiles fish
```

The `dotfiles` function is a wrapper for
[stow](https://www.gnu.org/software/stow/stow.html) and accepts the same command
line options.
