if [ -f ~/workspace/tools/ssh-find-agent/ssh-find-agent.bash ]
then
    source ~/workspace/tools/ssh-find-agent/ssh-find-agent.bash
    if ! test $SSH_AUTH_SOCK
    then
        set_ssh_agent_socket
    fi
fi

