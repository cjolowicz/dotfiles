eval "$(starship init bash)"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(asdf exec direnv hook bash)"

# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias g='git graph'
alias d='dirs -v'
alias cp='cp --verbose --interactive'
alias ls='exa'
alias la='exa --all'
alias ll='exa --long --all --time-style=long-iso'
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

# Usage: wedit [FILE]...
# ----------------------------------------------------------------------
# For each FILE, find its pathname using which(1) and invoke EDITOR on
# the result.
function wedit() {
    $EDITOR $(which "$@")
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
    stow --dir ~/.dotfiles --target ~ "$@"
}
