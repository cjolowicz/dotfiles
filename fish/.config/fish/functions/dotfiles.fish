function dotfiles --wraps stow --description 'Stow dotfiles'
    stow --dir=$HOME/Code/github.com/cjolowicz/dotfiles --target=$HOME $argv
end
