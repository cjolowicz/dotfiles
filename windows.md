# Windows

## Installation

- Parallels
- Windows 11
- Windows Terminal
- Chocolatey

## Administrator

```powershell
choco feature enable -n allowGlobalConfirmation
choco install firacodenf
choco install git.install
choco install vscode.install
choco install bat
choco install python311
choco install python310
choco install python39
choco install python38
```

## Shell

```powershell
git config --global user.email you@example.com
git config --global user.name "Your Name"
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
py -m pip install --user pipx
py -m pipx ensurepath
refreshenv
pipx install poetry
pipx install nox
pipx inject nox nox-poetry
```

## Microsoft.PowerShell_profile.ps1

```powershell
Invoke-Expression (&starship init powershell)
Set-PSReadlineOption -EditMode vi
```
