# big thatnks to https://github.com/mathiasbynens/dotfiles


if [[ -d "$HOME/.dotfiles" ]]; then
	DOTFILES_DIR="$HOME/.dotfiles";
	echo $DOTFILES_DIR
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
