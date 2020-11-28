" === NERDTree ===

" 打开目录树
map T :NERDTreeToggle<CR>

let NERDTreeMapOpenExpl = ""
" 往上退一级目录，并保证原目录是打开状态
let NERDTreeMapUpdirKeepOpen = "n"
" 往上退一级目录
let NERDTreeMapUpdir = "N"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "I"
let NERDTreeMapActivateNode = "i"
" 在一个新 Tab 中打开文件, 并切换过去
let NERDTreeMapOpenInTab = "o"
" 在一个新 Tab 中打开文件，并不切换
let NERDTreeMapOpenInTabSilent = "O"
" 预览文件, 光标不会跳转到文件中
let NERDTreeMapPreview = "go"
let NERDTreeMapCloseDir = ""
" 以当前目录作为树的根节点
let NERDTreeMapChangeRoot = "l"
" 打开编辑菜单栏
let NERDTreeMapMenu = ","
" 切换是否显示隐藏文件
let NERDTreeMapToggleHidden = "zh"
" 过滤: 指定文件和文件夹不显示
let NERDTreeIgnore = [
  \ '\.pyc$',
  \ '\.swp',
  \ '\.swo',
  \ '\.vscode',
  \ '__pycache__'
  \ ]


" === nerdtree-git-plugin ===
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" === vim-bufferline ===
" buffer 列表显示在 echo 信息栏
let g:bufferline_echo = 1


" === fzf.vim ===
" 打开 fzf 默认窗口，匹配文件列表, 等同于 :FZF
nnoremap <C-p> :Files<CR>
" 显示当前所有 buffer
map <LEADER><LEADER> :Buffers<CR>
" 使用 fzf Rg 命令, 快速搜索文件内容, 需要系统安装有 ripgrep
nnoremap <c-f> :Rg <right>
" 显示 marks
nnoremap <leader>m :Marks<CR>
" 显示历史打开的文件
nnoremap <leader>, :History<CR>
" 显示历史打开的命令
nnoremap <leader>. :History:<CR>
" [[B]Commits] 自定义被'git log'使用的选项
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] 定义用来产生tag的命令
" let g:fzf_tags_command = 'ctags -R'


" === ranger.vim ===
nnoremap <LEADER>ra :Ranger<CR>
" 去掉默认的映射键
let g:ranger_map_keys = 0


" === vim-signature ===
" 需要修改一下插件/autoload/mark.vim 里的 s:ForceGlobalRemoval(mark) 函数
" 将 a:mark 正则匹配去掉，保证其他 mark 可以正常的删除
let g:SignatureForceRemoveGlobal=1


" === vim-rooter ===
" 与 Far.vim 不兼容
" 对于非项目的，自动切换到当前文件所在的目录
let g:rooter_change_directory_for_non_project_files = 'current'
" 对于项目，向上递归，有如下目录或文件的，就是根目录
let g:rooter_patterns = [
  \ '.git', 'Makefile', '*.sln', 
  \ 'build/env.sh', '.vscode'
\]


" === vim-airline & themes ===
if !g:custom_statusline
" 使用 Powerline 字体来显示特殊符号
let g:airline_powerline_fonts = 1
" 单个tabs时在顶部显示缓冲区列表
let g:airline#extensions#tabline#enabled = 1
" 显示buffer id
let g:airline#extensions#tabline#buffer_nr_show = 1
" 使用 单个字符表示省略，节省2个字符空间
let g:airline#extensions#tabline#overflow_marker = '…'
" 不显示 tabs 编号
let g:airline#extensions#tabline#show_tab_nr = 0
" airline 主题
let g:airline_theme='murmur'
endif

