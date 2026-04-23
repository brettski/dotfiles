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

    if [[ $SETSHELL == "bash" ]]; then
        ln -sfv "$DOTFILES_DIR/.bash_profile" ~
    fi;
    if [[ $SETSHELL == "zsh" ]]; then
        ln -sfv "$DOTFILES_DIR/.zshrc" ~
        ln -sfv "$DOTFILES_DIR/.zshenv" ~
        ln -sfv "$DOTFILES_DIR/.zprofile" ~
    fi;

    ln -sfv "$DOTFILES_DIR/.gitconfig" ~
    ln -sfv "$DOTFILES_DIR/.gitignore" ~
    ln -sfv "$DOTFILES_DIR/.vimrc" ~
    ln -sfv "$DOTFILES_DIR/.alias" ~
    ln -sfv "$DOTFILES_DIR/.exports" ~
    ln -sfv "$DOTFILES_DIR/.path" ~

    . "$DOTFILES_DIR/.macos"
}

function integrations() {
    if [[ $SETSHELL == "zsh" ]]; then
        curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
    fi;
}

if [ "$1" == "--force" || "$1" == "-f" ]; then
    linkHome;
    integrations;
else
    echo "DOTFILES_DIR: $DOTFILES_DIR"
    read -p "This will probably overwrite files in your home directory. Are you SURE you want to do this (y/n) : " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        linkHome;
        integrations;
    fi
fi;

unset -f linkHome;
unset -f integrations;

if [[ $SETSHELL == "bash" ]]; then
    source ~/.bash_profile;
fi
if [[ $SETSHELL == "zsh" ]]; then
    exec zsh
fi
