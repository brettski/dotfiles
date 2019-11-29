#export PATH="/usr/local/opt/node@10/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/brettski/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/brettski/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/brettski/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/brettski/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

if [[ -d "$HOME/.dotfiles" ]]; then
	DOTFILES_DIR="$HOME/.dotfiles";
	echo "dotfile directory: $DOTFILES_DIR"
    # Load the shell dotfiles, and then some:
    # * ~/.path can be used to extend `$PATH`.
    for file in $DOTFILES_DIR/.{path,exports,alias}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;
    unset file;
else
	echo "unable to find .dotfiles folder, skipping"
fi


# zshell options/settings/updates
setopt EXTENDED_HISTORY
HISTSIZE=5000
SAVEHIST=3000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY