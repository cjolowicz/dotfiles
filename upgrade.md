# Upgrading

These upgrade instructions are arranged by installer.

## brew

```sh
brew update
brew upgrade
```

## curl

```sh
pyenv update
poetry self update
```

## pip

Use [pip-upgrade](https://github.com/cjolowicz/scripts/blob/master/python/pip-upgrade.sh).

```sh
pip-upgrade --command=tox tox-pyenv
pip-upgrade --command=autoflake epc ptvsd
/usr/local/opt/python/bin/python3.7 -m pip install --upgrade virtualfish
```

## pipx

```sh
pipx upgrade ...
```

## spacemacs

```sh
git -C $HOME/.emacs.d pull --rebase
```
