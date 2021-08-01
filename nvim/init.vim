"----------------------------------
" Author: timking
"----------------------------------
"        \   ^__^
"         \  (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

" 顶格配置
" sfile:p 获取当前文件的真实路径
" :h 去掉路径的最后部分
let g:nvim_home=expand('<sfile>:p:h')
" 是否使用自定义的状态栏
let g:custom_statusline = 0
" 记录上一个buffer的id
let g:prev_buffer_nr = 0


function! Dot(path) abort
  return g:nvim_home . "/" . a:path
endfunction


" 加载机器配置
exec "source " . Dot('scripts/machine.vim')

" 初始化 vim, 后续注释即可
" exec "source " . Dot('scripts/initialize.vim')

" 加载 editor 配置
exec "source " . Dot('scripts/editor.vim')

if !exists('g:vscode')
" 加载 navigator 配置, vscode 下窗口操作没有意义
exec "source " . Dot('scripts/navigator.vim')

" 加载插件，vscode-nvim 模式下可能存在很多不兼容
exec "source " . Dot('scripts/plugin.vim')
else
" 加载vscode下的一些配置
exec "source " . Dot('scripts/vscode.vim')
endif

" 加载 autocmd
exec "source " . Dot('scripts/autocmd.vim')
