#!/usr/bin/env bash

set -e
# Make sure we're up to date
#git pull origin master;

# Get current dir

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function linkHome() {
    read -p "Link .base_profile? (y/n) : " -n 1;
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        ln -sfv "$DOTFILES_DIR/.bash_profile" ~
    fi;
    read -p "Link .zshrc? (y/n) : " -n 1;
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        ln -sfv "$DOTFILES_DIR/.zshrc" ~
    fi;

    ln -sfv "$DOTFILES_DIR/.gitconfig" ~
    ln -sfv "$DOTFILES_DIR/.gitignore" ~
    ln -sfv "$DOTFILES_DIR/.vimrc" ~
    ln -sfv "$DOTFILES_DIR/.alias" ~
    ln -sfv "$DOTFILES_DIR/.exports" ~
    ln -sfv "$DOTFILES_DIR/.path" ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    linkHome;
else
    echo "DOTFIRES_DIR: $DOTFILES_DIR"
    read -p "This will probably overwrite files in your home directory. Are you SURE you want to do this (y/n) : " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        linkHome;
    fi;
fi;
unset linkHome;

. $DOTFILES_DIR/.macos

source ~/.bash_profile;
source ~/.zshrc
