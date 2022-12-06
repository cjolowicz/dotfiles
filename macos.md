# MacOS Big Sur > Ventura

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
- System > General > Default web browser: qutebrowser

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

cd .dotfiles
stow ssh
stow bash
stow git
stow asdf
stow gnupg
stow qutebrowser
stow spacemacs
```

## Installations

```sh
xcode-select --install
```

- [brew](brew.md)
- [asdf](asdf.md)
- [pipx](pipx.md)

## iTerm

- Profiles > Default > Text > Font: Fira Code 13p
- Profiles > Default > Text > Font > Use ligatures > On
- Profiles > Default > Windows > Transparency: 25
- Appearance > Windows > Hide scrollbars
- Appearance > Tabs > Show tab bar in fullscreen: disable
- Appearance > Panes > Show per-pane title bar with split panes: disable
