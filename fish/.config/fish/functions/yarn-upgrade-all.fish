function yarn-upgrade-all --description "Upgrade JavaScript packages"
    yarn outdated | sed '1,/^Package/d;/^Done/d' | awk '{print $1, $4}' | while read -l PACKAGE VERSION
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

        yarn upgrade --latest $PACKAGE
        and yarn run test
        and yarn run build
        and git commit -am "Upgrade to "$PACKAGE" "$VERSION
        or begin
            set_color red
            echo "last command exited with status $status" >&2
            set_color normal
            return 1
        end
    end
end

function yarn-upgrade-all-debug --description "Upgrade JavaScript packages"
    yarn outdated | sed '1,/^Package/d;/^Done/d' | awk '{print $1, $4}' | while read -l PACKAGE VERSION
        echo $PACKAGE $VERSION
    end
end
