function d --description 'Simulate dirs -v'
	printf "     0\t%s\n" (string replace -r '^'"$HOME"'($|/)' '~$1' -- $PWD)
	  string replace -r '^'"$HOME"'($|/)' '~$1' -- $dirstack | string join \n | cat -n;
end
