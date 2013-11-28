#!/bin/sh

. ~/.profile
xrdb ~/.Xresources
xmodmap ~/.Xmodmap
unclutter & xmonad | dzen2 -ta r
