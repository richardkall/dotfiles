# Dotfiles

> My personal set of configuration files.

## Setup

```bash
$ git clone https://github.com/richardkall/dotfiles.git ~/.dotfiles
$ sh ~/.dotfiles/bootstrap
```

When adding any new dotfiles, symlink them using:

```bash
$ sh ~/.dotfiles/symlink
```

## Customize

Add any local customizations to:

- `~/.aliases.local`
- `~/.gitconfig.local`
- `~/.vimrc.local`
- `~/.zshrc.local`

For a faster shell startup time, see https://gist.github.com/richardkall/0881b808289fc86ed582.

## License

MIT © [Richard Käll](http://richardkall.se)
