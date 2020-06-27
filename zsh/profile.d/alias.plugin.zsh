# Custom plugin for zsh
#
# Common aliases
#
# Author: TimKing <timking.nf@foxmail.com>
# Date:   Sat, Jun 27  16:36:11 GMT+8 2020
#

###### Common Environments ######

# 如果没有指定，则自动选择颜色
LS_OPTIONS='--color=auto'
# 是否输出颜色
CLICOLOR='Yes'
# 指定颜色
LSCOLORS='CxfxcxdxbxegedabagGxGx'


###### Command enhancements aliases ######

alias edit='vim'

alias ls='ls -GFh'
alias ll="ls -l"
alias l.='ls -d .*'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -pv'
alias less='less -FSRXc'
alias ssh='ssh -A'
alias ping='ping -c 5'
alias wget='wget -c'
alias lc='colorls'
alias lca='colorls -al'
alias scp="scp -p"


alias vper="${EDITOR:-edit} ~/.config/zsh/personal.zsh"
alias sper=". ~/.config/zsh/personal.zsh"


###### OSX alias ######

if [[ $CUSTOM_OS = "osx" ]]; then
  alias date="gdate"  # use gnu date replace date
fi
