# Upgrading

## Homebrew

```sh
brew update
brew upgrade
```

## Curl

```sh
pyenv update
poetry self update
```

## Pip

Use [pip-upgrade](https://github.com/cjolowicz/scripts/blob/master/python/pip-upgrade.sh).

```sh
pip-upgrade --command=tox tox-pyenv
pip-upgrade --command=autoflake epc ptvsd
/usr/local/opt/python/bin/python3.7 -m pip install --upgrade virtualfish
```

## Pipx

```sh
pipx upgrade ...
```

## Spacemacs

```sh
git -C $HOME/.emacs.d pull --rebase
```
