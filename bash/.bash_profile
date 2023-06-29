for _file in ~/.bash_profile.d/*
do
    . $_file
done

unset _file

# For interactive shells, also source ~/.bashrc.
case $- in
    *i*)
        . ~/.bashrc
        ;;
esac
