export PATH="$PATH:$HOME/.local/bin"
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
