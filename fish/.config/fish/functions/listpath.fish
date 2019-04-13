function listpath --argument-names var --description "Display entries in a path variable"
    set -q var[1]; or set var PATH
	  string replace -r '^'"$HOME"'($|/)' '~$1' -- $$var | string join \n | cat -n
end
