function git-show-objects
    set gitdir (git rev-parse --show-toplevel)/.git
    for file in $gitdir/objects/*/*
        set hash (basename (dirname $file))(basename $file)
        set type (git cat-file -t $hash)

        echo "==>" $hash "("$type")" "<=="
        echo
        git cat-file -p $hash
        echo
    end | less
end
