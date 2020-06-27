# Custom plugin for zsh
#
# fzf functions
#
# Author: TimKing <timking.nf@foxmail.com>
# Date:   Sat, Jun 27  16:30:17 GMT+8 2020
#

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# 利用 fzf 进行预览
fzf-preview() {
  fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'
}
