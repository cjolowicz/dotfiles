set -gx PATH ~/.pyenv/bin $PATH
status --is-interactive; and source (pyenv init - | psub)
pyenv global \
    3.8.5 \
    2.7.18 \
    3.5.9 \
    3.6.11 \
    3.7.8 \
    3.9.0b5
