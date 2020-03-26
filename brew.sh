#!/usr/bin/env bash

# Ensure brew is at latest
brew update
brew upgrade

# install commandline tools/apps/binaries
#brew node@10
brew nodenv
brew go
#brew nmap
brew openssl
brew telnet
brew wget
brew bat
brew p7zip

# cleanup after all that drinking
brew cleanup
