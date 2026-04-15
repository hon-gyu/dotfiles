```bash
stow -v -t ~ [app]
```

- `-t`: specify target

- Without -t, the target is automatically one level up from where you run stow
- When there's a conflict, `--adapt` takes target into stow dir and overwrite it
- `-n`: dry-run

- use `stow -nv <package>`
  - to see what stow will do (or what current symlinks are)
  - `v`: verbose

# Clean up `.DS_Store`

```bash
find ~/Dropbox/dotfiles -name ".DS_Store" -delete
```
