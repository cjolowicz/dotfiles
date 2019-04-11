set -gx PATH /usr/local/opt/sqlite/bin $PATH
set -gx MANPATH /usr/local/opt/sqlite/share/man ":$MANPATH"
set -gx LDFLAGS "-L/usr/local/opt/sqlite/lib" $LDFLAGS
set -gx CPPFLAGS "-I/usr/local/opt/sqlite/include" $CPPFLAGS
set -gx PKG_CONFIG_PATH "/usr/local/opt/sqlite/lib/pkgconfig" $PKG_CONFIG_PATH
