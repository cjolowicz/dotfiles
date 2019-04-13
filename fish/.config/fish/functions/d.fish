function d --description 'Simulate dirs -v and pushd +N' --argument n
    if set -q n[1]
        pushd +$n > /dev/null
    end
    printf "     0\t%s\n" (string replace -r '^'"$HOME"'($|/)' '~$1' -- $PWD)
    string replace -r '^'"$HOME"'($|/)' '~$1' -- $dirstack | string join \n | cat -n;
end
