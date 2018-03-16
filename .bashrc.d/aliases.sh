if [ -x /bin/egrep ];
then
    alias showbigfiles="sudo du -hsx * | egrep '([0-9][0-9][0-9]M|[0-9]G)' | sort -h"
fi

alias ipython="python -c 'import IPython; IPython.embed()'"
alias tree="tree --charset=ascii"
alias tmux="TERM=screen-256color tmux -2"
alias btmuz='pactl load-module module-loopback source=bluez_source.90_21_55_A2_18_44 sink=alsa_output.usb-Ether_Electronics_Co.__LTD_Audioengine_W3_20120611002-00-W3.analog-stereo'
alias yamlcheck='python -c "import yaml,sys;yaml.safe_load(sys.stdin)"'
alias gpg='gpg2'
alias sha512="python3 -c 'import crypt; print(crypt.crypt(\"test\", crypt.mksalt(crypt.METHOD_SHA512)))'"
