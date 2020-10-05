set -gx PATH ~/.pyenv/bin $PATH
status --is-interactive; and source (pyenv init - | psub)
pyenv global \
    3.9.0 \
    3.8.6 \
    3.7.9 \
    3.6.12 \
    3.5.10 \
    2.7.18
