# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval `dircolors ~/.dircolors`
    alias ls='ls --color=auto'
    alias egrep='egrep --color=auto'
fi
