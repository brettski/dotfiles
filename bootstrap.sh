#!/usr/bin/env bash

set -e
# Make sure we're up to date
git pull origin master;

# Get current dir

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#function copyHome() {
#    rsync   --exclude ".git/" \
#            --exclude ".DS_Store" \
#            --exclude ".osx" \
#            --exclude "bootstrap.sh" \
#            --exclude "README.md" \
#            --exclude "brew.sh" \
#            -avh --no-perms . ~;
#    source ~/.bash_profile;
#}

function linkHome() {
    ln -sfv "$DOTFILES_DIR/.bash_profile" ~
    ln -sfv "$DOTFILES_DIR/.gitconfig" ~
    ln -sfv "$DOTFILES_DIR/.gitignore" ~
    ln -sfv "$DOTFILES_DIR/.vimrc" ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then 
    linkHome;
else
    read -p "This will probably overwrite files in your home directory. Are you SURE you want to do this (y/n) : " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        linkHome;
    fi;
fi;
unset linkHome;