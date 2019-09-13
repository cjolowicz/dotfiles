function poetry-env-activate --description "Activate the virtualenv of a Poetry-managed Python project"
    source (dirname (poetry run which python))/activate.fish
end
