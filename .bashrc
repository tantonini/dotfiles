#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Activate dir colors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'

PS1="\[\033[38;5;246m\][\[$(tput sgr0)\]\[\033[38;5;117m\]\u@\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;117m\]\w\[$(tput sgr0)\]\[\033[38;5;246m\]]\[$(tput sgr0)\]\\$ "

export PATH=~/.local/bin:"$PATH"

# History size
HISTSIZE=100000
HISTFILESIZE=100000

# OSC-7 escape sequence for foot
osc7_cwd() {
	local strlen=${#PWD}
	local encoded=""
	local pos c o
	for (( pos=0; pos<strlen; pos++ )); do
		c=${PWD:$pos:1}
		case "$c" in
			[-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
			* ) printf -v o '%%%02X' "'${c}" ;;
		esac
		encoded+="${o}"
	done
	printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }osc7_cwd

# Yocto
export BB_ENV_PASSTHROUGH_ADDITIONS="DL_DIR SSTATE_DIR"
export DL_DIR="${HOME}/yocto-data/downloads"
export SSTATE_DIR="${HOME}/yocto-data/sstate"

[[ -f ~/.bash_local ]] && . "$HOME/.bash_local"
