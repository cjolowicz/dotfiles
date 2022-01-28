#!/bin/bash

set -euo pipefail

function log() {
    echo
    echo "✨ $*"
    echo
}

log "Upgrading Homebrew packages"
brew update && brew upgrade

log "Upgrading pipx applications"
pipx upgrade-all

log "Upgrading pip user-wide packages"
pip install --user --upgrade importmagic epc

git -C .emacs.d fetch

if ! git -C .emacs.d diff --quiet develop origin/develop
then
    log "Upgrading Spacemacs"
    git -C .emacs.d plog -p --stat --reverse develop..origin/develop
    git -C .emacs.d pull
else
    log "Spacemacs is up-to-date"
fi

log "Upgrading asdf plugins"
asdf plugin update --all

for python in 3.{7..11}
do
    log "Upgrading Python $python"
    asdf install python latest:$python
done
