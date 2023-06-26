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
    cat $(which "$@")
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
    stow --dir $HOME/Code/github.com/cjolowicz/dotfiles --target ~ "$@"
}

# Usage: batdiff [DIFF-ARG]..
# ----------------------------------------------------------------------
# Display diff with syntax highlighting.
function batdiff() {
    command diff "$@" | bat --plain --language=diff
}

# Usage: exatree [EXA-ARG]..
# ----------------------------------------------------------------------
# Display tree using exa.
function exatree() {
    ll --tree --color=always "$@" | LESS=FXSR less
}

# Usage: shebang COMMAND
# ----------------------------------------------------------------------
# Show the shebang of the given command on PATH.
function shebang() {
    local command=

    for command ; do
        script="$(which $command)"

        head -n1 "$script" | cut -c3-
    done
}

# Usage: metadata APP KEY
# ----------------------------------------------------------------------
# Show the metadata of the given Python app on PATH.
function metadata() {
    local json=false

    case $1 in --json) json=true; shift;; esac

    local app="$1" ; shift
    local python=$(shebang $app)

    if $json ; then
        $python <<EOF | jq -C . | LESS=FSRX less
import json
from importlib.metadata import metadata
print(json.dumps(metadata("$app").json))
EOF
    elif [ $# -eq 0 ] ; then
        $python <<EOF
from importlib.metadata import metadata
for key in sorted(set(metadata("$app"))):
  print(key)
EOF
    else
        for key ; do
            $python <<EOF
from importlib.metadata import metadata
for value in metadata("$app").get_all("$key"):
  print(value)
EOF
        done
    fi
}

# Usage: envvars [GREP-ARG..]
# ----------------------------------------------------------------------
# Show environment variables matching the patterns.
function envvars() {
    if [ $# -eq 0 ] ; then
        env | bat -l sh -p
    else
        env | grep "$@" | bat -l sh -p
    fi
}

# Usage: mkcd DIR
# ----------------------------------------------------------------------
# Create directory and cd into it.
function mkcd() {
    mkdir "$@"
    cd "$@"
}
