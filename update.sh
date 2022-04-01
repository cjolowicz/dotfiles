#!/bin/bash

set -euo pipefail

function header() {
    echo
    rich "[b]$*[/b]" --rule
    echo
}

header "Homebrew"
brew update && brew upgrade

header "pipx"
pipx upgrade-all --include-injected

header "pip"
pip install --user --upgrade importmagic epc

git -C ~/.emacs.d fetch

header "Spacemacs"
if ! git -C ~/.emacs.d diff --quiet develop origin/develop
then
    git -C ~/.emacs.d plog -p --stat --reverse develop..origin/develop
    git -C ~/.emacs.d pull
else
    echo "Already up-to-date."
fi

header "Poetry"
poetry self update

header "asdf"
asdf plugin update --all

for python in 3.{7..11}
do
    asdf install python latest:$python
done
