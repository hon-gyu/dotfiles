```bash
stow -v -t ~ [app]
```
- Without -t, the target is automatically one level up from where you run stow

- When there's a conflict, `--adapt` takes target into stow dir and overwrite it


`-n`: dry-run

```bash
find ~/Dropbox/dotfiles -name ".DS_Store" -delete
```

