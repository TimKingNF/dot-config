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

# 这行配置开启 rg 查找隐藏文件 及忽略 .git 文件, 替换默认的 find，加速查找
# -l 只显示至少有一个匹配项的路径
# --sortr 按最后修改时间排序
export FZF_DEFAULT_COMMAND='rg -l --hidden -i .git --sortr modified'

# 其他快捷键
# <C-r> 查找历史命令，回车后会复制到 shell 中
# <C-t> 查找当前目录下的文件，回车后会复制到 shell 中
# <M-c> alt-c, 列出当前文件夹下的目录，选择后会直接进入该文件夹

# 其他操作
# 在面板中按 tab 可以选中，多选

# 语法
# ^music 以 music 开头
# mp3$ 以 mp3 结尾
# 'word 严格匹配
# !word 不包含 word
# !.mp3$ 不以 .mp3 结尾

# 利用 fzf 进行预览
fp() {
  fzf --preview '[[ $(file --mime {}) =~ binary ]] && \ 
    echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || \
    rougify {} || cat {}) 2> /dev/null | head -500'
}

# 快速打开文件，和 fp 类似
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# 快速跳转目录，适合在 jump 不确定的情况下使用. 和 <M-c> 重复
# fd() {
#   local dir
#   dir=$(find ${1:-.} -path '*/\.*' -prune \
#     -o -type d -print 2> /dev/null | fzf +m) &&
#   cd "$dir"
# }

# 列出进程，kill
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
	echo $pid | xargs kill -${1:-9}
  fi
}

# === 配合 tmux 使用 ===

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
	tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# 快速选择可用的 session, 和 tm 有点重复
# fs() {
#   local session
#   session=$(tmux list-sessions -F "#{session_name}" | \
#     fzf --query="$1" --select-1 --exit-0) &&
#   tmux switch-client -t "$session"
# }