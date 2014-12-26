# ~/.bashrc: executed by bash(1) for non-login shells.

if [ -f ~/.bash.d/profile ] ; then
    . ~/.bash.d/profile
fi

case $- in
    *i*) ;;
      *) return;;
esac

if [ -d ~/.bash.d ] ; then
    for file in $(ls ~/.bash.d) ; do
        [ -z "$DEBUG" ] || echo "$file" >&2
        . ~/.bash.d/"$file"
    done
fi
