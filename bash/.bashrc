export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export VISUAL=emacsclient
export EDITOR=emacsclient

eval "$(pyenv init -)"

alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias g='git graph'
alias d='dirs -v'
alias cp='cp --verbose --interactive'
alias ls='ls --color=auto'
alias ll='ls -l --all --human-readable --time-style=long-iso'
alias mv='mv --verbose --interactive'
alias pd=pushd
alias edit=$EDITOR
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir --verbose --parents'
alias path='echo -e ${PATH//:/\\n}'

# Usage: fhelp [FUNCTION]...
# ----------------------------------------------------------------------
# Print the documentation for each FUNCTION defined in this file.
function fhelp() {
    local name=

    if [ $# -eq 0 ] ; then
        sed -n 's/^# Usage: //p' ~/.bashrc | sort
    fi

    for name
    do
        sed -n -e "/^# Usage: $name/,/^function $name/p" ~/.bashrc |
            sed -e '$d' -e 's/# //'
    done
}

# Usage: wcat [FILE]...
# ----------------------------------------------------------------------
# For each FILE, find its pathname using which(1) and invoke cat(1) on
# the result.
function wcat() {
    cat $(which "$@")
}

# Usage: wless [FILE]...
# ----------------------------------------------------------------------
# For each FILE, find its pathname using which(1) and invoke less(1) on
# the result.
function wless() {
    less $(which "$@")
}

# Usage: wldd [FILE]...
# ----------------------------------------------------------------------
# For each FILE, find its pathname using which(1) and invoke ldd(1) on
# the result.
function wldd() {
    ldd $(which "$@")
}

# Usage: wfile [-L] [FILE]...
# ----------------------------------------------------------------------
# For each FILE, find its pathname using which(1) and invoke file(1) on
# the result. With option `-L', dereference symlinks, repeatedly.
function wfile() {
    local file=
    if [ "$1" = "-L" ]
    then
        shift
        for file
        do
            if file=$(which "$file")
            then file $(realpath "$file")
            fi
        done
    else
        file $(which "$@")
    fi
}

# Usage: heading [ARG]..
# ----------------------------------------------------------------------
# Print a heading.
function heading() {
    local bold=
    local reset=

    if [ -t 1 ] ; then
        bold="\e[1m"
        reset="\e[0m"
    fi

    printf "\n==> ${bold}%s${reset} <==\n\n" "$*"
}

# Usage: vcat [FILE]...
# ----------------------------------------------------------------------
# Print each FILE preceded by its filename.
function vcat() {
    local file=

    for file
    do
        heading "$file"
        cat "$file"
    done
}

# Usage: dotfiles [PACKAGE]...
# ----------------------------------------------------------------------
# Stow dotfiles.
function dotfiles() {
    stow --dir ~/Code/github.com/cjolowicz/dotfiles --target ~ "$@"
}
