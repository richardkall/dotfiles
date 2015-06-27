# Dotfiles

> My personal set of configuration files.

## Requirements

The following must be installed:

- [CMake](http://www.cmake.org)
- [zsh](http://zsh.sourceforge.net)
- [Pure](https://github.com/sindresorhus/pure)
- [rcm](https://github.com/thoughtbot/rcm)

Everything is included in the [laptop script](https://github.com/richardkall/laptop).

## Install

```bash
$ git clone https://github.com/richardkall/dotfiles.git ~/.dotfiles
$ rcup -d ~/.dotfiles -x README.md -x LICENSE
```

## Customize

Put your local customizations in the home folder, append their file names with `.local`, and they will be sourced automatically.

## Extras

Base16 Terminal profiles can be found here: [richardkall/base16-osx](https://github.com/richardkall/base16-osx/)

## License

MIT © [Richard Käll](http://richardkall.se)
