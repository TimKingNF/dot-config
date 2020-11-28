" === Undotree ===
nmap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
" 不显示相对时间
let g:undotree_RelativeTimestamp = 0


" === vim-better-whitespace  ===
" 启用显示行尾空白符
let g:better_whitespace_enabled=1
" 保存时自动去除行尾空白符
let g:strip_whitespace_on_save=1
" 去除行尾空白符无需确认
let g:strip_whitespace_confirm=0
" 禁用特定文件类型下的空白符高亮
let g:better_whitespace_filetypes_blacklist=[
  \ 'far', 'diff', 'gitcommit', 
  \ 'unite', 'qf', 'help'
\]


" === nerdcommenter ===
" 注释后面带上空格
let NERDSpaceDelims=1


" === vim-anzu ===
" 下一个搜索内容
nmap = <Plug>(anzu-n-with-echo)
" 上一个搜索内容
nmap + <Plug>(anzu-N-with-echo)


" === Switch.vim ===
let g:switch_custom_definitions =
    \ [
    \   ['foo', 'bar', 'baz'],
    \   ['on', 'off'],
    \   ['On', 'Off'],
    \   ['ON', 'OFF'],
    \ ]


" === wildfire.vim ===
" 针对不同的文件，Text objects 的不同设置
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}"],
    \ "html,xml" : ["at", "it", "i'", 'i"', "i)", "i]", "i}"],
\ }


" === Vista.vim ===
nmap <silent> tt :Vista!!<CR>
nmap <silent> <C-t> :Vista finder coc<CR>
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'ctags'
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" 默认的使用的解析
" let g:vista_default_executive = 'coc'
" let g:vista_executive_for = {
    "   \ 'python': 'coc',
    "   \ }
" 渲染图标
let g:vista#renderer#enable_icon = 1


" === far.vim ===
" :F {pattern} {file-mask} [params] 只搜索
" :Far {pattern} {replace-with} {file-mask} [params] 查找并替换
" 在 far 窗口中执行 :Fardo 或者 s 进行替换
" 允许撤销, 在交互式窗口中输入 :Farundo 或者 u 快捷键
let g:far#enable_undo=1
" 设置搜索的工具为 rgnvim, 使用 nvim 异步接口访问 ag，需要安装 nvim 和 ripgrep
let g:far#source='rgnvim'


" === vim-easy-align ===
" 使用参考: https://xu3352.github.io/linux/2018/10/18/vim-table-format-in-html-or-markdown
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" === vim-visual-multi ===
" 默认键位使用指南
" Normal 情况下, <C-n> 可以选中多行相同的文本进行编辑
" Visual 模式下，对选中文本按 <C-n> 可以匹配相同文本，再多光标编辑.
" 按 n/N 可以跳过对应的查找，而多光标不选中
" 按 q 可以撤销上一个选中
let g:VM_maps = {}
" 相同位置的光标选择
let g:VM_maps["Select Cursor Down"] = '<C-j>'
let g:VM_maps["Select Cursor Up"]   = '<C-k>'
" 按 u 可以撤销编辑
let g:VM_maps["Undo"] = 'u'
" 按 <C-r> 重新应用
let g:VM_maps["Redo"] = '<C-r>'