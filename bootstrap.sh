#!/usr/bin/env bash

set -e
# Make sure we're up to date
#git pull origin master;

# Get current dir

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function linkHome() {
    read -p "Setup zsh or bash? (z/b) : " 
    echo ""
    if [[ $REPLY =~ ^[Zz] ]]; then
        SETSHELL="zsh";
    elif [[ $REPLY =~ ^[Bb] ]]; then
        SETSHELL="bash";
    else
        echo "No setup shell provided. leaving.";
        exit 1
    fi

    if [[ $SETSHELL -eq "bash" ]]; then
        ln -sfv "$DOTFILES_DIR/.bash_profile" ~
    fi;
    if [[ $SETSHELL -eq "zsh" ]]; then
        ln -sfv "$DOTFILES_DIR/.zshrc" ~
        ln -sfv "$DOTFILES_DIR/.zshenv" ~
    fi;

    ln -sfv "$DOTFILES_DIR/.gitconfig" ~
    ln -sfv "$DOTFILES_DIR/.gitignore" ~
    ln -sfv "$DOTFILES_DIR/.vimrc" ~
    ln -sfv "$DOTFILES_DIR/.alias" ~
    ln -sfv "$DOTFILES_DIR/.exports" ~
    ln -sfv "$DOTFILES_DIR/.path" ~

    . $DOTFILES_DIR/.macos
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    linkHome;
else
    echo "DOTFIRES_DIR: $DOTFILES_DIR"
    read -p "This will probably overwrite files in your home directory. Are you SURE you want to do this (y/n) : " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        linkHome;
    fi
fi;
unset linkHome;

if [[ $SETSHELL = "bash" ]]; then
    source ~/.bash_profile;
fi
if [[ $SETSHELL = "zsh" ]]; then
    source ~/.zshrc;
fi
