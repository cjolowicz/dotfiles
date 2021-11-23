# asdf
```
brew install asdf
```

```bash
# ~/.bash_profile
. /usr/local/opt/asdf/libexec/asdf.sh
```

## asdf-direnv
```
asdf plugin-add direnv
asdf install direnv latest
asdf global direnv latest
```

```bash
# ~/.bashrc
eval "$(asdf exec direnv hook bash)"
direnv() { asdf exec direnv "$@"; }
```

```bash
# ~/.config/direnv/direnvrc
source "$(asdf direnv hook asdf)"
```

```
# <project>/.envrc
use asdf
```

Run `direnv allow` within the project to trust this file.

## asdf-python
```
xcode-select --install
brew install openssl readline sqlite3 xz zlib

versions="3.10.0 3.11.0a2 3.9.9 3.8.12 3.7.12 3.6.15"

asdf plugin-add python
echo $versions | xargs -n1 asdf install python 
asdf global python $versions
```
