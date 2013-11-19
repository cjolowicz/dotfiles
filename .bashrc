# ~/.bashrc: executed by bash(1) for non-login shells.

if [ -f ~/.bash.d/profile ] ; then
    . ~/.bash.d/profile
fi

if [ -n "$PS1" ] && [ -d ~/.bash.d ] ; then
    for file in $(ls ~/.bash.d) ; do
        . ~/.bash.d/"$file"
    done
fi
