# Usage: prepend VARIABLE [DIR]...
# ----------------------------------------------------------------------
# Prepend directory to a PATH-style variable, unless it's there already.
function prepend() {
    local variable="$1"
    shift

    local directory=
    for directory
    do
        [ -d "$directory" ] || continue

        case ":${$variable:-}:" in *":$directory:"*) continue;; esac

        $variable="$directory${$variable:+:${$variable}}"
    done

    export $variable
}

# Source all files under `~/.bash.d`.
for _file in ~/.bash.d/*
do
    . $_file
done
unset _file
