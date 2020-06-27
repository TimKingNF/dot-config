# Custom plugin for zsh
#
# Ranger functions
#
# Author: TimKing <timking.nf@foxmail.com>
# Date:   Sat, Jun 27  17:32:49 GMT+8 2020
#

###### Ranger alias & functions ######

export RANGER_CACHE=${HOME}/.cache/rangerdir

alias ra='ranger --choosedir=${RANGER_CACHE};cd "$(cat ${RANGER_CACHE})"'

rg() {
    if [ -z "$RANGER_LEVEL" ]
    then
        ranger
    else
        exit
    fi
}
