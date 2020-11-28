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

alias edit='nvim'
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

alias ls='ls -GFh'
alias ll="ls -l"
# 只显示隐藏文件
alias l.='ls -d .'
# 复制时保留限和修改时间
alias cp='cp -v'
alias mv='mv -v'
alias mkdir='mkdir -pv'
alias less='less -FSRXc'
alias ssh='ssh -A'
alias ping='ping -c 5'
alias wget='wget -c'
# alias lc='colorls'
# alias lca='colorls -al'
alias scp="scp -p"


alias vper="${EDITOR:-edit} ~/.config/zsh/personal.zsh"
alias sper=". ~/.config/zsh/personal.zsh"
alias brash='~/.config/zsh/brash'
alias rm='brash -d -v'  # replace rm


###### Software ######

alias vim="nvim"
alias vi="nvim"


###### OSX alias ######

if [[ $CUSTOM_OS = "osx" ]]; then

alias date="gdate"  # use gnu date replace date
alias clearcp='printf "\e]1337;ClearCapturedOutput\e\\"'  # 告诉iterm2清理 CapturedOutput
alias sed="gsed"  # use gnu sed replace osx sed

fi
