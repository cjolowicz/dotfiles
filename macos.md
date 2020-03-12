# macos

## Apps

- iTerm2
- Docker
- VirtualBox

## Preferences

- System > Keyboard > Keyboard > Modifier Keys > Caps Lock Key > Escape
- System > Keyboard > Keyboard > Key Repeat > Fast
- System > Keyboard > Keyboard > Delay Until Repeat > Short
- System > Security & Privacy > Privacy > Accessibility > + > iTerm
- iTerm2 > Appearance > Tabs > Show tab bar in fullscreen > no
- iTerm2 > Profiles > + > Original
- iTerm2 > Profiles > Default > Keys > Left Option acts as Esc+
- iTerm2 > Profiles > Default > Text > Font > Change Font > Hack Nerd Font Regular 13pt
- iTerm2 > Profiles > Default > Text > Font > Use a different font for non-ASCII text > Hack Nerd Font Regular 13pt

## Other

- Google Chrome extension [Edit with Emacs](https://chrome.google.com/webstore/detail/edit-with-emacs/ljobjlafonikaiipfkggjbhkghgicgoh)

## Shell

Install XCode:

```sh
xcode-select --install  # it was already installed
```

Generate SSH key:

```sh
ssh-keygen -t rsa -b 4096 -C $EMAIL
```

Generate GPG key:

```sh
gpg --full-generate-key  # 4096 bits
gpg --armor --export $key
```
