" idea 中支持的命令, 可以通过 :actionlist 命令查看
" 使用对应的 :action {actionName} 来执行相应的命令
" 参考: https://github.com/JetBrains/ideavim
" https://github.com/Why8n/dotfiles/blob/master/ideavim/_ideavimrc

set ideajoin
set idearefactormode=keep
" 启用 vim-surround 功能
set surround 

" 回到 Normal 模式自动切换到英文输入法
" 需要插件 ideaVimExtension 支持
set keep-english-in-normal