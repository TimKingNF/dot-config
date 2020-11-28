" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin(printf('%s/plugged', g:nvim_home))

" === Discover ===
" Plug 'tpope/vim-repeat'  " 增强 . 操作，可以支持复杂的映射命令

" 禅模式: 后续想要扩充时再说
" Plug 'junegunn/limelight.vim'
" Plug 'junegunn/goyo.vim'

" jupyter.vim
" Plug 'wmvanvliet/jupyter-vim'


" === Dependencies ===
Plug 'rbgrouleff/bclose.vim'  " For ranger.vim


" === Enviroments ===
Plug 'tpope/vim-obsession'  " 保存 nvim session, 支持和 tmux-resurrect 配合在重启时恢复 nvim 状态


" === Navigator & file ===
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " 目录树
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }  " 在目录树上显示文件git状态
Plug '/usr/local/opt/fzf'  " 指定 fzf 的安装路径
Plug 'junegunn/fzf.vim'  " 需要安装 fzf
Plug 'francoiscabrol/ranger.vim'  " 文件浏览器
Plug 'tpope/vim-eunuch' " 一个语法糖, 提供直接对当前文件操作的方式, 同时保留编辑历史, 如 SudoWrite
Plug 'kshenoy/vim-signature'  " 书签插件, 主要用于在侧边栏显示书签标记
Plug 'DataWraith/auto_mkdir'  " vim 一个文件名时, 自动创建中间的目录结构
Plug 'vim-scripts/BufOnly.vim'  " :BufOnly 关闭除了当前文件以外的所有 buffer
" Plug 'airblade/vim-rooter'  " 自动切换项目路径
if !g:custom_statusline
Plug 'vim-airline/vim-airline'  " 状态栏 airline
Plug 'vim-airline/vim-airline-themes'  " airline 的主题
else
Plug 'bling/vim-bufferline'  " 在状态栏显示已经打开的 buffer
endif


" === Editor ===
Plug 'liuchengxu/vista.vim' " Taglist, 用于解析显示文件结构
Plug 'mbbill/undotree/' " Undo Tree
Plug 'tpope/vim-surround'  " TextObject对象增强
Plug 'ntpeters/vim-better-whitespace'  " 高亮行尾空格
Plug 'jiangmiao/auto-pairs'  " 括号引号成对输入
Plug 'preservim/nerdcommenter' " 注释插件
Plug 'osyo-manga/vim-anzu' " 给搜索文本添加序号
Plug 'AndrewRadev/switch.vim'  " 切换一些预定义的文本, 如 true 改为 false
Plug 'tmhedberg/SimpylFold'  " 折叠插件
Plug 'gcmt/wildfire.vim'  " 智能选择插件，Normal 模式下回车选择下一个最近的 text objects, 退格键选择上一个
Plug 'tpope/vim-capslock'  " 切换大小写插件, 使用 gC 切换
Plug 'brooth/far.vim'  " 多文件批量替换插件
Plug 'junegunn/vim-easy-align'  " 表格对齐插件
Plug 'mg979/vim-visual-multi', {'branch': 'master'}  " 多光标编辑插件
Plug 'vim-scripts/LargeFile'  " 打开文件过大时，关闭事件处理、撤销、语法加亮等功能
Plug 'frazrepo/vim-rainbow', {'on': ['RainbowLoad', 'RainbowToggle']}  " 对括号添加颜色


" === Auto Complete ===
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" === Git Support ===
Plug 'tpope/vim-fugitive' " git 命令支持, Gitlog
" Plug 'junegunn/gv.vim' " :GV 显示 Git 提交图形日志, 和 FZF:Commits 相对来说全屏显示更大一点 
Plug 'airblade/vim-gitgutter' " 在侧边栏显示 git 文件内容变化, 并增强 git 暂存区操作
Plug 'fszymanski/fzf-gitignore', { 'on': 'FzfGitignore' }  " 利用模板创建 gitignore 文件


" === Markdown Support ===
" markdown 预览
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 
 \ 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }  " 动态表格增强
Plug 'dkarter/bullets.vim', { 'for' : 'markdown' }  " 输入增强，自动添加符号 * - 


" === C/Cpp Suport ===
" Plug 'taxilian/a.vim'  " 输入 :A 在 h/cpp 文件间切换


" === Syntax Support ===
Plug 'chr4/nginx.vim', { 'for': 'conf' }
" Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'conf' }  " 给 .tmux.conf 添加高亮提示


" === Dress ===
Plug 'liuchengxu/space-vim-theme' " space 主题配色
Plug 'ayu-theme/ayu-vim' " ayu 主题配色
Plug 'ryanoasis/vim-devicons'  " 和其他插件兼容，显示文件图标



" === 应用相关的插件 ===
" 启动界面. 输入 nvim 打开之后默认显示最近打开的文件, 并支持数字选择
Plug 'mhinz/vim-startify'
" 备忘录插件. 按 <LEADER>? 触发
Plug 'lifepillar/vim-cheat40'
" 启动时间检测
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
" 日历
Plug 'mattn/calendar-vim', { 'on': 'Calendar' }

call plug#end()


" 加载各个插件的自定义配置
for file in split(glob(Dot('scripts/plugins/*.vim')), '\n')
  exec 'source' file
endfor
