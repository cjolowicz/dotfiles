# https://github.com/pyenv/pyenv/issues/1219
set -gx LDFLAGS "-L/usr/local/opt/zlib/lib" $LDFLAGS
set -gx CPPFLAGS "-I/usr/local/opt/zlib/include" $CPPFLAGS
set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig" $PKG_CONFIG_PATH
