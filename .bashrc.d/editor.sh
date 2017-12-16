vim=`which vim`
if [ -x $vim ]; then
    alias vi="$vim"
    EDITOR="$vim"
else
    EDITOR=/bin/vi
fi
