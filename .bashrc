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

if [ $HOSTNAME == "nomad" ]
then
    workstation="true"
elif [ $HOSTNAME == "d356336.wg.dir.telstra.com" ]
then
    workstation="true"
else
    workstation="false"
fi

set -o vi

os_string=`uname -s`

[ -z "$PS1" ] && return

shopt -s histappend
shopt -s checkwinsize

HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=10000
HISTFILE=~/.bash_history.$HOSTNAME
export HISTCONTROL HISTSIZE HISTFILESIZE

PATH=~/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

if [ -e /opt/apache-maven-3.0.4/bin ]
then
    PATH=/opt/apache-maven-3.0.4/bin:$PATH
fi


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

case "$os_string" in
SunOS)
    PATH=/usr/sfw/bin:/opt/csw/bin:/opt/csw/sbin:$PATH:/usr/ucb
    export JAVA_HOME=/usr/j2se
    alias egrep=/usr/sfw/bin/gegrep
    alias grep=/usr/sfw/bin/ggrep
    ;;
Linux)
    if [ -e /usr/lib/jvm/java ]
    then
        export JAVA_HOME=/usr/lib/jvm/java
        PATH=$PATH:$JAVA_HOME/bin
    fi
    # Linux specific aliases
    alias listening='netstat --numeric --listening --inet --inet6'
    ;;
esac

# Set up a useful prompt
PS1="${NOCOLOR}[${GREEN}$os_string${NOCOLOR}][${BLUE}\w${NOCOLOR}]\n${YELLOW}\u${NOCOLOR}@${BLUE}\h${NOCOLOR} \$ "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\h - \u: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval `dircolors ~/.dircolors`
    alias ls='ls --color=auto'
    alias egrep='egrep --color=auto'
fi

#less=`which less`
#if [ -x "$less" ]; then
#    PAGER=$less
#fi
#export PAGER

EDITOR=/bin/vi
vim=`which vim`
if [ -x $vim ]; then
    alias vi=$vim
    EDITOR=$vim
fi
export EDITOR

alias set_proxy='export http_proxy=http://d356336.wg.dir.telstra.com:3128/ https_proxy=http://d356336.wg.dir.telstra.com:3128/'

# Settings that are only relevant on workstations
if [ $workstation == "true" ]
then
    alias goworkspace='cd ~/workspace'
    alias gopsphere='cd ~/workspace/Personal/psphere'
    alias gopuppet='cd ~/workspace/puppet-parent'
    alias gojira='cd ~/workspace/telstra-jira-plugin/plugins'
    alias gogitolite='cd ~/workspace/gitolite-admin'
    alias goiap='cd ~/workspace/puppet-parent/iap'
    alias gointernal='cd ~/workspace/puppet-parent/internal'
    alias gobpvas='cd ~/workspace/puppet-parent/iap'
    alias ipython="python -c 'import IPython; IPython.embed()'"
    alias tree="tree --charset=ascii"
    alias rna="setarch i686 firefox -no-remote -P VPN"
    alias tmux="TERM=screen-256color tmux -2"
    alias btmuz='pactl load-module module-loopback source=bluez_source.90_21_55_A2_18_44 sink=alsa_output.usb-Ether_Electronics_Co.__LTD_Audioengine_W3_20120611002-00-W3.analog-stereo'
    alias vipump='/usr/bin/vim -S ~/workspace/sessions/pump.vim'
fi

PROJECT_HOME=$HOME/workspace
WORKON_HOME=$PROJECT_HOME/virtualenvs
if [ -e /usr/bin/virtualenvwrapper.sh ]
then
    source /usr/bin/virtualenvwrapper.sh
fi
#source /etc/bash_completion.d/virtualenvwrapper

export PS1

# Add rbenv stuff
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Cache packages that pip downloads
export PIP_DOWNLOAD_CACHE=~/.pip/cache
