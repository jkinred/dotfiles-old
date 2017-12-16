# Solarized colours
NOCOLOR="\[\033[00m\]"
BASE02="\[\033[30m\]"
BASE03="\[\033[01;30m\]"
RED="\[\033[31m\]"
ORANGE="\[\033[01;31m\]"
GREEN="\[\033[32m\]"
BASE01="\[\033[01;32m\]"
YELLOW="\[\033[33m\]"
BASE00="\[\033[01;33m\]"
BLUE="\[\033[34m\]"
BASE0="\[\033[01;34m\]"
MAGENTA="\[\033[35m\]"
VIOLET="\[\033[01;35m\]"
CYAN="\[\033[36m\]"
BASE1="\[\033[01;36m\]"
BASE2="\[\033[37m\]"
BASE3="\[\033[01;37m\]"

set -o vi

os_string=`uname -s`

#[ -z "$PS1" ] && return


PATH=~/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set up a useful prompt
#PS1="${NOCOLOR}[${GREEN}$os_string${NOCOLOR}][${BLUE}\w${NOCOLOR}]\n${YELLOW}\u${NOCOLOR}@${BLUE}\h${NOCOLOR} \$ "

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;\h - \u: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

for file in ~/.bashrc.d/*; do
    source $file
done

export EDITOR
export PS1
export PATH
