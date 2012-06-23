if [ $HOSTNAME == "nomad" ]
then
    workstation="true"
elif [ $HOSTNAME == "d356336" ]
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
    echo "Setting SunOS specific profile options"
    PATH=/usr/sfw/bin:/opt/csw/bin:/opt/csw/sbin:$PATH:/usr/ucb
    export JAVA_HOME=/usr/j2se
    alias egrep=/usr/sfw/bin/gegrep
    alias grep=/usr/sfw/bin/ggrep
    # Allow Vim to look pretty
    export TERMINFO=~/.terminfo
    if [ -e $TERMINFO/x/xterm-256color ]
    then
        export TERM=xterm-256color
    else
        export TERM=xtermc
    fi
    ;;
Linux)
    echo "Setting Linux specific profile options"
    if [ -e /usr/lib/jvm/java ]
    then
        export JAVA_HOME=/usr/lib/jvm/java
        PATH=$PATH:$JAVA_HOME/bin
    fi
    if [ -e /usr/share/terminfo/x/xterm-256color ]
    then
        export TERM=xterm-256color
    else
        export TERM=xterm-color
    fi
    # Linux specific aliases
    alias listening='netstat --numeric --listening --inet --inet6'
    ;;
esac

# Set up a useful prompt
PS1="[\[\e[1;33m\]$os_string\[\e[0m\]][\[\e[1;34m\]\w\[\e[0m]\]\n\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\] \$ "

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
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias egrep='egrep --color=auto'
fi

less=`which less`
if [ -x "$less" ]; then
    PAGER=$less
fi
export PAGER

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
    alias gopsphere='cd ~/workspace/Personal/psphere'
    alias gopuppet='cd ~/workspace/Work/puppet'
    alias ipython="python -c 'import IPython; IPython.embed()'"
    alias tree="tree --charset=ascii"
    export PYTHONPATH=$HOME/projects/Personal/psphere
fi


#WORKON_HOME=$HOME/.virtualenvs
#source /etc/bash_completion.d/virtualenvwrapper

export PATH
export PS1
