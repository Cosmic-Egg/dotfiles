#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# My additions
eval "$(starship init bash)"
eval "$(fzf --bash)"

alias la='ls -A'
alias ll='ls -alF'
alias install='sudo pacman -S'
alias update='sudo pacman -Syu'
# shell wrapper for yazi allows current directory to change when exiting yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
export EDITOR=nvim
fastfetch
