# brew

## x86_64
```sh
softwareupdate --install-rosetta
arch -x86_64 /bin/bash <(
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
)
alias brew@x86_64="arch -x86_64 /usr/local/bin/brew"
# comment out `disable!` line
HOMEBREW_NO_INSTALL_FROM_API=1 brew@x86_64 edit python@3.7
HOMEBREW_NO_INSTALL_FROM_API=1 brew@x86_64 install python@3.7
```

## taps
- homebrew/cask-fonts
- d12frosted/emacs-plus
- homebrew/cask-versions

## bottles

### Fonts
- font-fira-code-nerd-font
- font-cascadia-code

### GNU
- coreutils
- findutils
- gawk
- gnu-tar
- gnu-sed
- grep
- man-db

### Cryptography
- openssl
- gnupg
- pinentry-mac

### Utilities
- stow
- tree
- git-delta
- sqlite3
- xz
- git
- git-extras
- gh
- pandoc
- direnv
- make
- lesspipe
- moreutils
- fswatch

### Modern Unix
- ripgrep
- exa
- bat
- fzf
- starship
- vivid
- dust
- fd
- jq
- yq
- jc
- dog
- mosh
- duf
- bottom
- sd
- hexyl
- mtr
- zoxide
- hyperfine
- croc
- choose-rust
- ctop
- angle-grinder
- glow
- jo
- wader/tap/fq
- htmlq
- fx
- xsv
- miller
- entr
- ast-grep

### Bash
- bash
- bash-completion
- shellcheck
- bashate
- shfmt
- bash-language-server

### Editors
- vim
- neovim
- emacs-plus@30 --with-spacemacs-icon --with-native-comp

### Applications
- iterm2
- homebrew/cask/docker
- 1password
- 1password-cli
- evernote
- signal
- telegram
- spotify
- slack
- virtualbox-beta
- notion

### Python
- python@3.11
- python@3.10
- python@3.9
- python@3.8
- python-launcher
- pipx
- pyenv

### More
- rlwrap
- cmake
- wasm-pack
