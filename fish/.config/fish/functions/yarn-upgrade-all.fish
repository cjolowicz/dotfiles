function yarn-upgrade-all --description "Upgrade JavaScript packages"
    argparse --name=yarn-upgrade-all --max-args=0 'h/help' 'l/latest' 'i/include=+' 'e/exclude=+' -- $argv
    or return

    if set -q _flag_help
        echo "usage: yarn-upgrade-all [options]

options:
  -l, --latest        update to the latest version
  -i, --include GLOB  only update matching packages
  -e, --exclude GLOB  do not update matching packages
  -h, --help          print this message
"
        return 0
    end

    set -l options
    if set -q _flag_latest
        set -a options --latest
    end

    yarn outdated |
    sed '1,/^Package/d;/^Done/d' |
    awk '{print $1, $3, $4}' |
    while read -l PACKAGE WANTED LATEST
        set -l VERSION

        if set -q _flag_latest
            set VERSION $LATEST
        else
            set VERSION $WANTED
        end

        echo
        set_color brwhite
        echo -n "==>"
        set_color yellow
        echo -n " "$PACKAGE
        set_color brblue
        echo -n " "$VERSION
        set_color brwhite
        echo -n " <=="
        set_color normal
        echo
        echo

        set -l skip false

        if set -q _flag_include
            set skip true
            for pattern in $_flag_include
                if string match --entire --quiet $pattern $PACKAGE
                    set skip false
                end
            end
        end

        if set -q _flag_exclude
            for pattern in $_flag_exclude
                if string match --entire --quiet $pattern $PACKAGE
                    set skip true
                end
            end
        end

        if $skip
            set_color yellow
            echo "Skipping..." >&2
            set_color normal
            continue
        end

        yarn upgrade $options $PACKAGE
        and yarn run test < /dev/null
        and yarn run build < /dev/null
        and git commit -am "Upgrade to "$PACKAGE" "$VERSION
        or begin
            set_color red
            echo "last command exited with status $status" >&2
            set_color normal
            return 1
        end
    end
end
