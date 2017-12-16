if [ -d ~/workspace/tools/go ]
then
    export GOROOT=~/workspace/tools/go
    PATH=$PATH:~/workspace/tools/go/bin
fi

if [ -d ~/workspace/golang ]
then
    export GOPATH=~/workspace/golang
    PATH=$PATH:~/workspace/golang/bin
fi
