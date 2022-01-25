# MacOS Big Sur > Monterey

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

## Finder Preferences

- Finder > Sidebar > $user
- Finder > General > New Finder Windows show: $user
- Finder > Context Menu > Show View Options > Sort By: Snap To Grid > Use as Defaults
- Finder > Context Menu > Show View Options > Use as Defaults
- Apple > Force Quit... > Finder: Relaunch

## Restore

- Finder: Copy Backup/$HOME/Code to home directory

```sh
cp -va Backup/$HOME/.ssh .
cp -va Backup/$HOME/.gnupg .
```

## Installations

- [brew](brew.md)
- [pipx](pipx.md)

```sh
xcode-select --install
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
```

## User configuration

```sh
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

## iTerm

- Font: Hack Nerd Font 13p
- Hide scrollbars
