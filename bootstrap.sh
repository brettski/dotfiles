#!/usr/bin/env bash

# Make sure we're up to date
git pull origin master;

function copyHome() {
    rsync   --exclude ".git/" \
            --exclude ".DS_Store" \
            --exclude ".osx" \
            --exclude "bootstrap.sh" \
            --exclude "README.md" \
            --exclude "brew.sh" \
            -avh --no-perms . ~;
    source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then 
    copyHome;
else
    read -p "This will probably overwrite files in your home directory. Are you SURE you want to do this (y/n) : " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        copyHome;
    fi;
fi;
unset copyHome;
