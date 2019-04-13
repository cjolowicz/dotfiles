fish_vi_key_bindings

set -gx EDITOR emacsclient --alternate-editor=
set -gx VISUAL $EDITOR
set -gx GPG_TTY (tty)

function edit --wraps emacsclient --description 'Invoke $EDITOR'
    $EDITOR $argv
end
