# Initialize Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# append to PATH
export PATH="$PATH:$HOME/.local/bin"

# prepend to PATH
for package in coreutils findutils gawk gnu-sed gnu-tar make grep
do
    export PATH="/opt/homebrew/opt/$package/libexec/gnubin:$PATH"
done

for package in openssl@3
do
    export PATH="/opt/homebrew/opt/$package/bin:$PATH"
done

for directory in ~/Code/*
do
    if [ -d "$directory" ]
    then
        export CDPATH="${CDPATH:-}:$directory"
    fi
done
unset directory

export VISUAL=emacsclient
export EDITOR=emacsclient

. /opt/homebrew/etc/profile.d/bash_completion.sh
. ~/.profile.private
. ~/.bashrc
