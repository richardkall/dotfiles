# Dotfiles

> My personal set of configuration files.

## Dependencies

The following must be installed:

- [Homebrew](http://brew.sh)
- [zsh](http://zsh.sourceforge.net)
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- [Pure](http://zsh.sourceforge.net)

Everything is included in the [laptop script](https://github.com/richardkall/laptop).


## Installation

Clone repo:

```bash
$ git clone https://github.com/richardkall/dotfiles.git ~/.dotfiles
```

Install [rcm](https://github.com/thoughtbot/rcm):

```bash
$ cd ~/.dotfiles
$ brew bundle
```

Install dotfiles:

```bash
$ rcup -d ~/.dotfiles -x README.md -x Brewfile
```

To update dotfiles, use:

```bash
$ rcup
```

## Local configs

Put your local customizations in the home folder, append their file names with `.local`, and they will be sourced automatically.

## Extras

Base16 Terminal profiles can be found here: [richardkall/base16-osx](https://github.com/richardkall/base16-osx/)
