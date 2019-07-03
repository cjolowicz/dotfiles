set -gx PATH /usr/local/opt/llvm/bin $PATH
set -gx MANPATH /usr/local/opt/llvm/man ":$MANPATH"
set -gx LDFLAGS "-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"
# set -gx CC clang
# set -gx CXX clang++
# set -gx LD ld.lld
# set -gx AR llvm-ar
# set -gx RANLIB llvm-ranlib
