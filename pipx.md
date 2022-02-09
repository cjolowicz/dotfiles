# pipx

```sh
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
pipx install rich-cli
```

These need to be globally importable for Spacemacs:

```sh
python3 -m pip install --user importmagic epc
```

For Poetry:

```sh
curl -sSL https://install.python-poetry.org | python3 -
```
