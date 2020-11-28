"
" ,------.   ,--.,--.  ,--.                 
" |  .---' ,-|  |`--',-'  '-. ,---. ,--.--. 
" |  `--, ' .-. |,--.'-.  .-'| .-. ||  .--' 
" |  `---.\ `-' ||  |  |  |  ' '-' '|  |    
" `------' `---' `--'  `--'   `---' `--'    
"
" 编辑相关的配置

" leader 键设置
let mapleader=";"

let &t_ut=''

" 终端模式下的滚动模式
let g:neoterm_autoscroll = 1

set enc=utf-8  " 设置编辑文件的内码是 UTF-8
set nocompatible  "  不需要和 vi 兼容
set number  " 显示行号
set relativenumber  " 显示相对行号
set cursorline  " 显示当前行
set expandtab  " tab 替换为空格
set softtabstop=2  " 按 tab 和 退格键，也按2个空格算
set tabstop=4  " 默认显示 tab 符号宽4个空格
set shiftwidth=2  " 代码输入时按 { 和 回车的缩进宽度
set autoindent  " 记住上一行的位置, 自动缩进
set list  " 显示非可见字符
set listchars=tab:▸\ ,trail:▫  " tab和空格字符显示
set scrolloff=5  " 滚动的时候保持光标所在行不变
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap  " 自动折叠行
set tw=0  " 不自动拆分插入行
" set indentexpr=
set foldmethod=indent  " 基于缩进折叠
set foldlevel=99  " 折叠等级
" set foldenable  " 自动折叠函数类等
" 格式化选项, 默认值是tcq
" t: 使用 textwidth 自动回绕文本
" c: 使用 textwidth 自动回绕注释，自动插入当前注释前导符
" q: 允许 gq 排版时排版注释
" r: 在插入模式按回车时，自动插入当前注释前导符
" o: 在普通模式按 o 或者 O 时，自动插入当前注释前导符
" l: 插入模式不分行: 当一行已经超过 textwidth 时，插入命令不会自动排版
set formatoptions-=t fo+=coql
set splitright
set splitbelow
set noshowmode  " 不显示模式
set showcmd
" set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu  " 使用zsh命令行自动补全风格
" set ignorecase  " 正则匹配不区分大小写
set smartcase  " 智能匹配大小写,在全小写时不区分大小写
set shortmess+=c
set inccommand=split
set ttyfast " 提高在 tty 窗口显示下的滚动效果
set lazyredraw " 提高在大量结果显示下的滚动效果
" set visualbell
set colorcolumn=120  " 显示对齐线 120字符
set backspace=indent,eol,start  " 修改编辑模式, 允许在插入模式下随意增删
set updatetime=4000  " 显示消息的时间
" retab " 打开文件时自动转换所有tab 为空格, 但部分文件如 Makefile 等使用空格会出错
" set noswapfile  " 设置不生成swap文件
filetype plugin indent on
set maxmempattern=2000  " 使用正则匹配时,对于大文件有时候会出现内存耗尽的问题,稍微调大一点
" set nrformats=  " 设置vim将数字识别为几进制, 默认会区分进制. 配合C-a, C-x指令使用
set autowrite  " 切换文件的时候自动保存
set ignorecase smartcase  " 模式匹配的时候，只有在没有大写字符的情况下不区分大小写
set makeprg=make\ -j4  " 启用四路并发编译
set linebreak  " 折行时不切断单词
" setlocal spell spelllang=en  " 对英语进行拼写检查
" setlocal spell spelllang+=cjk  " 对东亚字符（中日韩）不进行拼写检查

" 标记空格错误，避免 tab 字符前的空格和行尾空格
let g:c_space_errors = 1
" 激活gnu扩展
let g:c_gnu = 1
" 让gnu的扩展可以正常显示, 不会被标记成错误
let g:c_no_curly_error = 1
" 对 printf 等函数的字符串不进行加亮
let g:c_no_cformat = 1
" 取消注释中的加亮字符串功能
" unlet g:c_comment_strings

" 用于隐藏标记
" if has('conceal')
  " set conceallevel=0  " 设置为2启用, 会隐藏json引号
  " set concealcursor=niv
" endif

" 设置光标类型, 在 iterm2 中
if $TERM_PROGRAM =~ "iTerm"
  if empty($TMUX)
    " 进入插入模式时启用 CursortShape=1
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    " 退出插入模式
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    " 进入 Replace 模式
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  endif
endif

" 剪贴板设置
" if has('mac')
let g:clipboard = {
\   'name': 'macOS-clipboard',
\   'copy': {
\      '+': 'pbcopy',
\      '*': 'pbcopy',
\    },
\   'paste': {
\      '+': 'pbpaste',
\      '*': 'pbpaste',
\    },
\   'cache_enabled': 0,
\ }
" endif
" if has('clipboard')
set clipboard& clipboard+=unnamedplus
" endif

" backup设置, 设置了 undo 之后 backup 就没有必要了
" set nobackup
let &backupdir=printf("%s/tmp/backup//,.", g:nvim_home)
let &directory=printf("%s/tmp/backup//,.", g:nvim_home)
" Undo 设置
" if has('persistent_undo')  " 这里需要Vim7.3+的undo持久化功能
set undofile
let &undodir=printf("%s/tmp/undo,.", g:nvim_home)
" endif

" 支持鼠标操作. vscode 中无需开启
if has('mouse') && !exists('g:vscode')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    " GUI运行时，或者终端是 xterm 兼容，并且不是 Mac（Mac 上的终端声称自己是 xterm，但行为并不完全相同）
    " 启用完全的鼠标支持
    set mouse=a
  else
    " 只在 n( normal )、v( Virtual )、i( insert ) 几个模式下支持鼠标
    set mouse=nvi
  endif
endif


"                                                               
" ,------.,--.,--.      ,--------.                              
" |  .---'`--'|  | ,---.'--.  .--',--. ,--.,---.  ,---.  ,---.  
" |  `--, ,--.|  || .-. :  |  |    \  '  /| .-. || .-. :(  .-'  
" |  |`   |  ||  |\   --.  |  |     \   ' | '-' '\   --..-'  `) 
" `--'    `--'`--' `----'  `--'   .-'  /  |  |-'  `----'`----'  
"                                 `---'   `--'                 
" 
" 针对文件类型单独设定
" vim:set et sts=2 tw=68 com-=mb\:* com+=fb\:* fo=tcqaw:


"
" ,--.   ,--.                      ,--.                
" |   `.'   | ,--,--. ,---.  ,---. `--',--,--,  ,---.  
" |  |'.'|  |' ,-.  || .-. || .-. |,--.|      \| .-. | 
" |  |   |  |\ '-'  || '-' '| '-' '|  ||  ||  |' '-' ' 
" `--'   `--' `--`--'|  |-' |  |-' `--'`--''--'.`-  /  
"                    `--'   `--'               `---'   
"
" 放置编辑器映射快捷键相关的配置

" === File ===

" 刷新 init.vim
nmap <silent> <LEADER>rc :source $MYVIMRC<CR>
  \ :exec ":set filetype=".&filetype<CR>
  \ :echo "init.vim Reloaded."<CR>

" 刷新文件
nmap <LEADER>rr :e!<CR>

" Save & quit
" noremap Q :q<CR>
" noremap S :w!<CR>


" === Editor ===

" 输出 <LEADER>↵ 取消 Search 高亮
nmap <LEADER><CR> :nohlsearch<CR>

" 缩进
nnoremap < <<
nnoremap > >>


" === Cusor Move ===

" 快速进入 select 模式
" nmap <leader>rw <Esc>viw<C-G>

" 快速光标移动
" Ctrl + U/D: 5行上下移动
noremap <silent> <C-U> 5k
noremap <silent> <C-D> 5j
" Ctrl + H: 跳到行首第一个非空白字符
noremap <silent> <C-H> ^
" Ctrl + L: 跳到行尾
noremap <silent> <C-L> $
" Ctrl + j 和 Ctrl + k
noremap <silent> <C-J> j
noremap <silent> <C-K> k
" 行内快速单词跳转：W 前进5个单词；B 回退5个单词
noremap <silent> W 5w
noremap <silent> B 5b

" 快速定位某个字母: 配合f 或者 t使用( 如fa、ta ), 重复一次
noremap - ;
" 快速定位某个字母: 配合f 或者 t使用, 反向重复一次
noremap _ ,


" === 宏相关 ===

" 显示所有的宏
noremap <leader>n :reg  <left>

" 映射 n 键为录制宏功能, 并去掉原来的q键
noremap n q
noremap q <nop>


" === Commands ===

" 命令行模式下输入 %% 立马获取文件当前路径
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'


" === Terminal ===

" 打开一个窗口用于开启终端
" 退出命令行编辑模式 按 ⌃\n, 配置为 <C-\><C-n>
map <LEADER>/ :set splitright<CR>:vsp<CR>:term<CR>

" 退出终端模式
tnoremap <C-B> <C-\><C-N>


