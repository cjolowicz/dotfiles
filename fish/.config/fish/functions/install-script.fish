function install-script --description "Install script to ~/.local/bin"
    set --local bindir ~/.local/bin

    mkdir -p $bindir

    for file in $argv
        set --local file (realpath $file)
        set --local name (basename $file | string split -r -m1 .)[1]

        if not test -x $file
            echo $file is not executable >&2
            return 1
        end

        ln -s $file $bindir/$name
    end
end
