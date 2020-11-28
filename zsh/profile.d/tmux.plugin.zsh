# Custom plugin for zsh
#
# Tmux function
#
# Author: TimKing <timking.nf@foxmail.com>
# Date:   Sat, Jun 27  17:22:36 GMT+8 2020
#

###### Tmux environments ######

if [ $TMUX ];then
    # export TERM=tmux-256color
    export TERM=screen-256color
    PATH=${HOME}/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin/:/bin:/sbin
    unset LDFLAGS CPPFLAGS
fi


# Disable auto-setting terminal title. From: ZSH
DISABLE_AUTO_TITLE="true"
