# Custom plugin for zsh
#
# Docker function
#
# Author: TimKing <timking.nf@foxmail.com>
# Date:   Sat, Jun 27  17:09:55 GMT+8 2020
#

###### Docker enhancement functions ######
do-upg() {
  docker-machine upgrade default
}

# docker-compose install
do-c() {
  docker-compose $@
}

# get container ip
do-ip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

# clean docker images
do-cl-img() {
  for item in $(docker images | grep "<none>" | sed -e 's/  */ /g' | cut -d ' ' -f3); do
    docker rmi $item
  done
}


###### Kubernetes alias & functions ######
alias kl="kubectl"
alias kld="kubectl describe"
