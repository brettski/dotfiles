#!/usr/bin/env bash

# Ensure brew is at latest
brew update
brew upgrade

# install commandline tools/apps/binaries
brew go
brew nmap
brew node
brew openssl
brew telnet
brew wget
brew bat

# cleanup after all that drinking
brew cleanup
