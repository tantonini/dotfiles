# .bashrc

set_ps1 () {
    PS1="\[\033[38;5;246m\][\[$(tput sgr0)\]\[\033[38;5;117m\]\u@\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;117m\]\w\[$(tput sgr0)\]\[\033[38;5;246m\]]\[$(tput sgr0)\]\\$ "
}

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# History size
HISTSIZE=100000
HISTFILESIZE=100000

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

set_ps1

# Activate dir colors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# Aliases
alias ll='ls -al --color=auto' 2>/dev/null
alias l='ls -al --color=auto' 2>/dev/null

unset rc
