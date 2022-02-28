# Initialize prompt using starship.
eval "$(starship init bash)"

# Initialize asdf-direnv for rewriting PATH per-directory.
eval "$(asdf exec direnv hook bash)"

# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }

# Initialize fzf for a nicer history search.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Binding for fzf_cd conflicts with `ESC c` in vi mode.
bind -m vi-command -r '\ec'
bind -m vi-insert -r '\ec'

# Display fzf in full screen.
export FZF_DEFAULT_OPTS='--no-height --no-reverse'

# Support ^L in vi mode.
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Use bat to view manpages (aka batman).
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# A few aliases.
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias g='git graph'
alias c='eval $(__fzf_cd__)'
alias d='dirs -v'
alias cp='cp --verbose --interactive'
alias ls='exa --icons'
alias la='exa --icons --all'
alias ll='exa --icons --all --long --time-style=long-iso'
alias mv='mv --verbose --interactive'
alias pd=pushd
alias edit=$EDITOR
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir --verbose --parents'
alias path='echo -e ${PATH//:/\\n}'
alias cat='bat -p'

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
# For each FILE, find its pathname using which(1) and invoke bat(1) on
# the result.
function wcat() {
    bat $(which "$@")
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

# Usage: usage COMMAND [ARG]..
# ----------------------------------------------------------------------
# Print the help.
function usage() {
    $@ --help | bat --language=man --style=plain
}

# Usage: venv [VENV]
# ----------------------------------------------------------------------
# Create Python virtual environment.
function venv() {
    virtualenv "${@:1: $#-1}" "$HOME/.venvs/${@: -1}"
}

# Usage: activate [VENV]
# ----------------------------------------------------------------------
# Activate Python virtual environment.
function activate() {
    if [ $# -eq 0 ]
    then
        if [ -f venv/bin/activate ] ; then
            . venv/bin/activate
        elif [ -f .venv/bin/activate ] ; then
            . .venv/bin/activate
        else
            echo "venv not found" >&2
            return 1
        fi
    else
        if [ -f "$HOME/.venvs/$1/bin/activate" ] ; then
            . "$HOME/.venvs/$1/bin/activate"
        elif [ -f "$1/bin/activate" ] ; then
            . "$1/bin/activate"
        else
            echo "venv not found" >&2
            return 1
        fi
    fi
}

# Usage: dotfiles [PACKAGE]...
# ----------------------------------------------------------------------
# Stow dotfiles.
function dotfiles() {
    stow --dir ~/.dotfiles --target ~ "$@"
}
