# Initialize prompt using starship.
eval "$(starship init bash)"

# Initialize direnv.
eval "$(direnv hook bash)"

# Initialize fzf for a nicer history search.
. ~/.fzf.bash

# Enable completion for 1Password CLI.
. <(op completion bash)

# Binding for fzf_cd conflicts with `ESC c` in vi mode.
bind -m vi-command -r '\ec'
bind -m vi-insert -r '\ec'

# Display fzf in full screen.
export FZF_DEFAULT_OPTS='--no-height --no-reverse'

# Support ^L in vi mode.
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Use bat to view manpages (aka batman).
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Enable color theme for file listings.
export LS_COLORS="$(vivid generate iceberg-dark)"
export EXA_COLORS="\
:da=38;5;58\
:uu=38;5;31\
:ur=38;5;215\
:uw=38;5;202\
:ux=38;5;208\
:ue=38;5;208\
:gr=38;5;214\
:gw=38;5;202\
:gx=38;5;208\
:tr=38;5;214\
:tw=38;5;202\
:tx=38;5;208\
:sn=38;5;70\
:sb=38;5;28"
