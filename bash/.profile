# ~/.profile: executed by the command interpreter for login shells.

if [ "$UID" -eq 0 ] ; then
    umask 0022
fi

if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] ; then
    . "$HOME/.bashrc"
fi
