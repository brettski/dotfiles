# dotfiles

## WIP

Getting all of this into shape. Opted to flatten to structure over a separate dirctory for each section (e.g. git). Dotfiles remain in `.dotfiles` folder and are symlink'd to from $HOME. Common location is `~/.dotfiles`

## References

* [https://dotfiles.github.io/](https://dotfiles.github.io/)
* [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [https://github.com/webpro/dotfiles](https://github.com/webpro/dotfiles)
* [https://github.com/mihaliak/dotfiles](https://github.com/mihaliak/dotfiles)

## Getting started

### Get Repository

from $HOME clone the repository:  
`% git clone git@github.com:brettski/dotfiles.git .dotfiles`  
or https if not using ssh:  
`% git clone https://github.com/brettski/dotfiles.git .dotfiles`

### Bootstrap The Dotfiles

Run the shell script to setup the dotfiles goo. It will ask if you want to setup for zsh or bash. Linking files from `$HOME` folder will overwrite those files in your home folder. Ensure there are no configurations you wish to copy in to the dotfile folder versions of those files first. It's probably a good idea to same them somewhere first. 😉

`% ./bootstrap.sh`

That should do it for setting up links to the dotfiles

## Install [Homebrew](https://brew.sh)

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## Brew Bundle file

[https://github.com/Homebrew/homebrew-bundle](https://github.com/Homebrew/homebrew-bundle)

Use `% brew bundle` to install dependencies listed in bundle file, **Brewfile**

For reference: to create a **Brewfile** from currently installed casks/formulae/tabs run:  
`% brew bundle dump`

## Future Thoughts

Add Homebrew stuff to bootstrap? Still not sure if I want a single run.

Add cask installs to Brewfile (e.g. Atom, vscode)
