export GOPATH=$HOME/go

# append to PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GOPATH/bin"

# prepend to PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export PATH="$HOME/.pyenv/versions/3.12-dev/bin:$PATH"
export PATH="/usr/local/opt/python@3.11/bin:$PATH"
export PATH="/usr/local/opt/python@3.11/libexec/bin:$PATH"

for directory in $HOME/Code/*
do
    if [ -d "$directory" ]
    then
	export CDPATH="${CDPATH:-}:$directory"
    fi
done
unset directory

export VISUAL=emacsclient
export EDITOR=emacsclient

export PYTHON_CONFIGURE_OPTS='--enable-framework --enable-optimizations --with-lto'
export PY_PYTHON=3.11
export PY_PYTHON3=3.11
export PIPX_DEFAULT_PYTHON=python3.11

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

[[ -r ~/.bashrc ]] && . ~/.bashrc
[[ -r ~/.profile.private ]] && . ~/.profile.private

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
