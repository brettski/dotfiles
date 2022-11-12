#!/usr/bin/env bash

# References
# https://github.com/nodenv/nodenv
# https://github.com/nodenv/nodenv-installer
# https://github.com/nodenv/node-build#readme


curl -fsSL https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-installer | bash

# curl -fsSL https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-doctor | bash

~/.nodenv/bin/nodenv install -l | grep '^16.\|^18.'

echo "nodenv install <version> to install"
echo "set system-wide default in ~/.nodenv/version"
echo "To set global version, use: nodenv global <version>"
echo "NOTE: The curl command in this script will also update nodenv and node-build"
echo "see, https://github.com/nodenv/node-build#upgrading, for updating node-build"

