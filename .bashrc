#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Activate dir colors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

alias ls='ls --color=auto'
alias ll='ls -al --color=auto'

PS1="\[\033[38;5;246m\][\[$(tput sgr0)\]\[\033[38;5;117m\]\u@\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;117m\]\w\[$(tput sgr0)\]\[\033[38;5;246m\]]\[$(tput sgr0)\]\\$ "

export PATH=~/.local/bin:"$PATH"
