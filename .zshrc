# Info:
#   http://zsh.sourceforge.net/Doc/Release/Files.html#Startup_002fShutdown-Files
#   https://scriptingosx.com/2019/06/moving-to-zsh-part-2-configuration-files/#zsh%20Configuration%20Files

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
# shopt -s histappend;

# Autocorrect typos in path names when using `cd`
# shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
# for option in autocd globstar; do
# 	shopt -s "$option" 2> /dev/null;
# done;

# Add tab completion for many Bash commands
# if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
# 	# Ensure existing Homebrew v1 completions continue to work
# 	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
# 	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
# elif [ -f /etc/bash_completion ]; then
# 	source /etc/bash_completion;
# fi;

# Enable tab completion for `g` by marking it as an alias for `git`
# if type _git &> /dev/null; then
# 	complete -o default -o nospace -F _git g;
# fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
# complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
# complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# -----------------------------------------------------------------------------

# Pure prompt
#   Initialize the prompt system (if not so already)
# autoload -U promptinit; promptinit
#   Options (https://github.com/sindresorhus/pure#example)
#     Turn on git stash status
# zstyle :prompt:pure:git:stash show yes
#   Choose pure prompt
# prompt pure

