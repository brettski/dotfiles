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

# git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
CH10=$'\n'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
# Hanging tick on following line adds a linefeed. I couldn't figure out how to add one inline
zstyle ':vcs_info:git:*' formats '%K{111}%F{0} %r %f%k%K{184}%F{0} ⌥ %b %f%k%K{240} %u %c %k
'
zstyle ':vcs_info:git' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '

# MacOS default: %n@%m %1~ %#
#PROMPT='%(?.√.%F{red}?%?)%f %F{green}%~%f %# '
#PROMPT='%F{green}%~%f ${vcs_info_msg_0_} ${CH10}%(?.%F{green}√.%F{red}?%?)%f  %# '
PROMPT='${vcs_info_msg_0_} %(?.%F{green}√.%F{red}?%?)%f %F{green}%~%f %# '
echo "done"
