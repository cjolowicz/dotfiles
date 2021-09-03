# yabai

In Recovery Mode:

```
csrutil disable --with kext --with dtrace --with nvram --with basesystem
```

In root shell:

```
echo "$USER ALL = (root) NOPASSWD: /usr/local/bin/yabai --load-sa" > /private/etc/sudoers.d/yabai
yabai --install-sa
```

In normal shell:

```
stow yabai
brew services start yabai
```

System Preferences:

- Accessibility > + > yabai

## Updating

```
brew services stop yabai
brew upgrade yabai
sudo yabai --uninstall-sa
sudo yabai --install-sa
brew services start yabai
```
