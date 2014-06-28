# Dotfiles

Clone repo:

```
$ git clone https://github.com/richardkall/dotfiles.git ~/.dotfiles
```

Install [rcm](https://github.com/thoughtbot/rcm):

```
$ cd ~/.dotfiles
$ brew bundle
```

Install dotfiles:

```
$ rcup -d ~/.dotfiles -x README.md -x Brewfile
```

To update dotfiles, use:

```
$ rcup
```

Put your customizations in the home folder and append them with `.local`:
