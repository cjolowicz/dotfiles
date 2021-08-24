export PATH="$PATH:$HOME/.local/bin"
export VISUAL=emacsclient
export EDITOR=emacsclient

eval "$(pyenv init -)"

alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cp='cp --verbose --interactive'
alias ls='ls --color=auto'
alias mv='mv --verbose --interactive'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir --verbose --parents'
