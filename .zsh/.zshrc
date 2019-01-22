fpath=( "$HOME/.zsh/autoload" $fpath )

autoload -U promptinit; promptinit
prompt pure

# Primary prompt with additional tweaks.
typeset -g PROMPT='%(?.%F{white}.%F{red})❯%f '

source "$ZDOTDIR/plugins/zsh-autopair/autopair.zsh"
source "$ZDOTDIR/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh"
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

autoload -U add-zsh-hook
add-zsh-hook preexec _preexec_fasd

# Register fasd to track most used files and directories.
function _preexec_fasd() {
	if (hash fasd &>/dev/null) {
		fasd --proc $(fasd --sanitize "$1") &>/dev/null
	}
}

alias g='git'
alias r='ranger'
alias v='nvim'
alias t='tmux -f $HOME/.tmux/tmux.conf'
