export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="$PATH:/usr/local/opt/llvm/bin"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export VISUAL=emacsclient
export EDITOR=emacsclient

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

[[ -r "/usr/local/opt/asdf/libexec/asdf.sh" ]] && . "/usr/local/opt/asdf/libexec/asdf.sh"

[[ -r ~/.bashrc ]] && . ~/.bashrc
