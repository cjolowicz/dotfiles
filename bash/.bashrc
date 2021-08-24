export PATH="$PATH:$HOME/.local/bin"
export VISUAL=emacsclient
export EDITOR=emacsclient

eval "$(pyenv init -)"

alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cp='cp --verbose --interactive'
alias mv='mv --verbose --interactive'
alias mkdir='mkdir --verbose --parents'
