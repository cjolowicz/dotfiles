set -gx EMAIL claudio.jolowicz@cyren.com
set -gx EDITOR emacsclient --alternate-editor=
set -gx VISUAL $EDITOR
set -gx GPG_TTY (tty)

function edit --wraps emacsclient --description 'Invoke $EDITOR'
    $EDITOR $argv
end
