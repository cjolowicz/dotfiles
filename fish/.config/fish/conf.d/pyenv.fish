set -gx PATH ~/.pyenv/bin $PATH
status --is-interactive; and source (pyenv init - | psub)
pyenv global 3.8.2 2.7.18 3.5.9 3.6.10 3.7.7 3.9.0a5
