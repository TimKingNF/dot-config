# Software config for software
#
# Author: TimKing <timking.nf@foxmail.com>
# Date:   Sat, Jun 27  18:36:16 GMT+8 2020
#


###### Homebrew ######

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
# 禁止 brew 自动更新，需要更新时手动执行 brew update
export HOMEBREW_NO_AUTO_UPDATE=true


###### IPython ######
# ipython 配置目录
export IPYTHONDIR=~/.config/py/ipython


###### Neo Vim ######
export NVIM_HOME=~/.config/nvim
export MYVIMRC=${NVIM_HOME}/init.vim
# 使用 vim 来访问 manpage
export MANPAGER="vim -M +MANPAGER -"


###### Navi ######
export NAVI_PATH=~/.config/navi
# 使用快捷键 <C-g> 打开navi
command -v navi >/dev/null && eval "$(navi widget zsh)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# NVM nodejs包管理工具
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Golang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
