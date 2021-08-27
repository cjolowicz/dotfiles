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

- [brew](brew.md)

```sh
xcode-select --install
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
pyenv install 3.9.6
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
```

## User configuration

```sh
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

## iTerm

- Font: Hack Nerd Font 13p
- Hide scrollbars
