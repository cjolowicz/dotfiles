# Usage: prepend VARIABLE [DIR]...
# ----------------------------------------------------------------------
# Prepend directory to a PATH-style variable, unless it's there already.
# Based on: https://stackoverflow.com/a/24522107
function prepend() {
    local variable="$1" directory= suffix=
    shift

    for directory
    do
        [ -d "$directory" ] || continue

        suffix=":${!variable}:"
        suffix=${suffix//:$directory:/:}
        suffix=${suffix#:}
        suffix=${suffix%:}

        printf -v "$variable" '%s' "${directory}${suffix:+:}${suffix}"
    done

    export "$variable"
}

# Source all files under `~/.bash.d`.
for _file in ~/.bash.d/*
do
    . $_file
done
unset _file
