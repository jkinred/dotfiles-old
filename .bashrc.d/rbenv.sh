export PATH="$HOME/.rbenv/bin:$PATH"
rbenv=`which rbenv &> /dev/null`
if [ $? -eq 0 ]
then
    eval "$(rbenv init -)"
fi
