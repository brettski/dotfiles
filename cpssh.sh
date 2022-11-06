#!/usr/bin/env bash

set -e

echo "Computer's username (not wsl name)"

read USERNAME

if [ -d "/mnt/c/Users/$USERNAME/.ssh" ] ; then 
    cp -r /mnt/c/Users/$USERNAME/.ssh ~/
    rm -f ~/.ssh/known_hosts*
fi

ls -lasi ~/.ssh

echo ""
echo "don't forget to chmod 500 the private key!"
