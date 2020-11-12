# Path to your oh-my-bash installation.
export OSH=/home/cjolowicz/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="powerline-multiline"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  pip
  ssh
  tmux
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=()

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $OSH/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export VISUAL=emacsclient
export EDITOR=emacsclient
export ALTERNATE_EDITOR=
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
ulimit -c unlimited
export PATH="$PATH:$HOME/.local/bin"
unalias -a
alias -- -='cd -'
alias ..='cd ../'
alias ...='cd ../../'
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
alias less='less --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --chop-long-lines'
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
