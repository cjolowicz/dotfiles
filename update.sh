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

pythonbuild=.asdf/plugins/python/pyenv/plugins/python-build/bin/python-build

for python in 3.{7..11}
do
    installed=$(
        find .asdf/installs/python/ -mindepth 1 -maxdepth 1 -printf '%f\n' |
            grep "^${python}")

    latest=$(
        $pythonbuild --definitions |
            grep "^${python}" | sort -V | tail -n1)

    if [ "$installed" != "$latest" ]
    then
        log "Upgrading Python $python from $installed to $latest"
        asdf install python $latest
    else
        log "Python $python is up-to-date ($latest)"
    fi
done
