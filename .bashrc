# ~/.bashrc
#	                  _                     _                ___  ____
#	__      _____  __| |_ __   ___  ___  __| | __ _ _   _   / _ \/ ___|
#	\ \ /\ / / _ \/ _` | '_ \ / _ \/ __|/ _` |/ _` | | | | | | | \___ \
#	 \ V  V /  __/ (_| | | | |  __/\__ \ (_| | (_| | |_| | | |_| |___) |
#	  \_/\_/ \___|\__,_|_| |_|\___||___/\__,_|\__,_|\__, |  \___/|____/
#	                                                |___/

#######################################################################

source ~/.config/conf-custom/aliases
source ~/.config/conf-custom/secret-aliases

#######################################################################

eval "$(starship init bash)"
export PATH=$HOME/.krypta:$PATH
export VISUAL=nvim
export EDITOR="$VISUAL"
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export HISTSIZE=10000
export HISTFILESIZE=10000

#######################################################################

bind "set completion-ignore-case on"

#######################################################################

# sprawdź czy sesja jest interaktywna
[[ $- != *i* ]] && return

# wczytaj bash_completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?} # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs} ]] &&
	type -P dircolors >/dev/null &&
	match_lhs=$(dircolors --print-database)

if [[ ${EUID} == 0 ]]; then
	PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
else
	PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi

# pozwól rootowi na aplikacje x11 (gui)
xhost +local:root >/dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases
# Enable history appending instead of overwriting.  #139609
