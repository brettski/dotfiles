# big thatnks to https://github.com/mathiasbynens/dotfiles


if [[ -d "$HOME/.dotfiles" ]]; then
	DOTFILES_DIR="$HOME/.dotfiles";
	echo "dotfiles located at $DOTFILES_DIR"
else
	echo "unable to find .dotfiles folder, exiting"
	return
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
for file in $DOTFILES_DIR/.{path,exports,alias}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
