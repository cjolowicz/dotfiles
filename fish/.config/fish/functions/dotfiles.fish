function dotfiles --wraps stow --description 'Stow dotfiles'
    stow --dir ~/.dotfiles --target ~ $argv
end
