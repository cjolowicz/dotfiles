function poetry-env-activate --description "Activate the virtualenv of a Poetry-managed Python project"
    source (poetry env info --path)/bin/activate.fish
end
