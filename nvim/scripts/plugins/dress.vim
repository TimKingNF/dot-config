" === 设置 nvim 的主题颜色等 ===
" 
" Requirements:
" Plug 'liuchengxu/space-vim-theme'
" Plug 'liuchengxu/vista.vim'
" Plug 'ayu-theme/ayu-vim'

" set laststatus=2  " from eleline.vim
set termguicolors     " 设置真彩色
" set background=dark

if exists("g:reloaded")
  " echom "exists"
else
  " echom "load color"
  let ayucolor="mirage"
  color ayu
  let g:reloaded = 1
  let g:colorizer_syntax = 1
  let g:space_vim_transp_bg = 1
  colorscheme space_vim_theme

  " 覆盖coc-highlight的光标选中颜色
  hi CocHighlightText ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
endif


" === 自定义状态栏设置 ===

if g:custom_statusline
" 256配色表
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
let s:colors = {
  \   140 : '#af87d7', 149 : '#99cc66', 160 : '#d70000',
  \   171 : '#d75fd7', 178 : '#ffbb7d', 184 : '#ffe920',
  \   208 : '#ff8700', 232 : '#333300', 197 : '#cc0033',
  \   214 : '#ffff66', 124 : '#af3a03', 172 : '#b57614',
  \   32  : '#3a81c3', 89  : '#6c3163', 169 : '#d75faf',
  \   46  : '#00ff00', 49  : '#00ffaf',
  \   235 : '#262626', 236 : '#303030', 237 : '#3a3a3a',
  \   238 : '#444444', 239 : '#4e4e4e', 240 : '#585858',
  \   241 : '#606060', 242 : '#666666', 243 : '#767676',
  \   244 : '#808080', 245 : '#8a8a8a', 246 : '#949494',
  \   247 : '#9e9e9e', 248 : '#a8a8a8', 249 : '#b2b2b2',
  \   250 : '#bcbcbc', 251 : '#c6c6c6', 252 : '#d0d0d0',
  \   253 : '#dadada', 254 : '#e4e4e4', 255 : '#eeeeee',
\ }

function! s:extract(group, what, ...) abort
if a:0 == 1
    return synIDattr(synIDtrans(hlID(a:group)), a:what, a:1)
  else
    return synIDattr(synIDtrans(hlID(a:group)), a:what)
  endif
endfunction


function! MyStatusLine() abort
  let l:left = '%<' " 最左侧
  let l:curname = '%#MyCurFname#%{MyCurFname()}%*'  " 显示文件名和当前文件状态
  let l:git_branch = '%#MyGitBranch#%{MyGitBranch()}%*'
  let l:git_status = '%#MyGitStatus#%{MyGitStatus()}%*'
  " coc 插件
  " 显示当前函数, 来自 coc
  let l:coc_status = '%#MyStatusCoc#%{MyStatusCoc()}%*'
                " \. '%6*%{get(b:,'coc_current_function','')}%*'
  " let l:anzu = '%{anzu#search_status()}'  " 来自 anzu 插件
  let l:vista_status = '%#VistaStatus#%{NearestMethodOrFunction()}%*'  " vista 插件

  let l:common = l:left
              \. l:curname
              \. l:git_branch
              \. l:git_status
              \. l:coc_status
              \. l:vista_status

  let l:right = '%=' " 调整到最右侧

  " 打印文件相关信息
  " let l:m_r_f = '%#Eleline7# %m%r%y %*'  " 文件修改状态, 文件类型
  let l:pos = '%#MyStatusPos#%l/%L:%c%V |'  " 当前光标位置信息
  let l:enc = ' %{&fenc != "" ? &fenc : &enc} | %{&bomb ? ",BOM " : ""}'  " 当前编码信息
  let l:ff = '%{&ff}%*'  " 当前文件类型风格
  " let l:pct = '%#Percentage# %P '  " 文件百分比
  return l:common
        \. l:right
        \. l:pos
        \. l:enc
        \. l:ff
        \. " "
endfunction

function! s:IsTempFile() abort
  if !empty(&buftype) | return 1 | endif
  if &previewwindow | return 1 | endif
  let filename = expand('%:p')
  if filename =~# '^/tmp' | return 1 | endif
  if filename =~# '^fugitive:' | return 1 | endif
  return 0
endfunction

function! s:GetPaste() abort
  if !&paste | return '' |endif
  return "%#MyStatusPaste# paste %*"
endfunction

" utf8 特殊符号：http://blog.neten.de/posts/333/
function! MyCurFname() abort
  let status = '  '
            \. (&readonly ? " " : '')
            \. (&filetype ==# 'startify' ? '' : expand('%:p:t'))
            \. (exists('b:table_mode_active') ? (b:table_mode_active ? ' ⊞' : ' ') : ' ')
            \. (&modified ? ' ⚡' : ' ')
  return status
endfunction

" 显示当前 git 分支
function! MyGitBranch(...) abort
  if exists('g:loaded_fugitive')  " 依赖 vim-fugitive 插件
    let l:head = fugitive#head()
    let l:symbol = "  \ue0a0"
    return (empty(l:head) ? '' : l:symbol.l:head) ." "
  endif
  return ''
endfunction

" 显示当前 git 文件状态
function! MyGitStatus() abort
  let l:summary = [0, 0, 0]
  if exists('b:sy.stats')
    let l:summary = b:sy.stats
  elseif exists('b:gitgutter.summary')
    let l:summary = b:gitgutter.summary
  endif
  if max(l:summary) > 0
    return ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2]
  endif
  return ''
endfunction

" 显示 coc status
function! MyStatusCoc() abort
  if exists('g:coc_status') && get(g:, 'coc_enabled', 0) | return ' ' . g:coc_status.' ' | endif
  return ''
endfunction

" vista 显示最近的函数, 这里内部使用的是coc.nvim
function! NearestMethodOrFunction() abort
  if !exists('g:coc_status') || empty(g:coc_status) | return '' | endif
  let l:func = get(b:, 'vista_nearest_method_or_function', '')
  return empty(l:func) ? '' : "\uf794 ". l:func
endfunction

function! MyHighlight() abort
  let l:bg = 237
  " 设置光标行字体颜色
  hi CursorLine guifg=#00ff87 ctermfg=48
  exec printf("hi StatusLine guibg=%s ctermbg=%d", s:colors[l:bg], l:bg)
  call s:hi("MyCurFname", [236, 140], [171, ''], 'bold')
  call s:hi('MyGitBranch', [184, l:bg] , [89, ''], 'bold')
  call s:hi('MyGitStatus', [208, l:bg] , [89, ''])
  call s:hi('MyStatusCoc', [169, l:bg] , [89, ''])
  call s:hi('VistaStatus', [49, l:bg]  , [89, ''])
endfunction

" 高亮颜色函数
function! s:hi(group, dark, light, ...) abort
  let [fg, bg] = &bg ==# 'dark' ? a:dark : a:light
  " 设置背景色
  if empty(bg) && &bg ==# 'light'
    let reverse = s:extract('StatusLine', 'reverse')
    let ctermbg = s:extract('StatusLine', reverse ? 'fg' : 'bg', 'cterm')
    let guibg = s:extract('StatusLine', reverse ? 'fg': 'bg' , 'gui')
  else
    let ctermbg = bg
    let guibg = s:colors[bg]
  endif
  execute printf('hi %s ctermfg=%d guifg=%s ctermbg=%d guibg=%s',
               \ a:group, fg, s:colors[fg], ctermbg, guibg)
  if a:0 == 1
    " 设置字体
    execute printf('hi %s cterm=%s gui=%s', a:group, a:1, a:1)
  endif
endfunction

" 插入模式切换配色
function! s:InsertStatuslineColor(mode) abort
  if a:mode == 'i'
    call s:hi('MyCurFname' , [251, 32] , [251, 89])
  elseif a:mode == 'r'
    call s:hi('MyCurFname' , [232, 160], [232, 160])
  else
    call s:hi('MyCurFname' , [232, 178], [89, ''])
  endif
endfunction

function! SetStatusLine()
  if &previewwindow | return | endif
  if s:IsTempFile() | return | endif
  setl statusline=%!MyStatusLine()
  call MyHighlight()
endfunction

augroup statusline
  autocmd!
  autocmd User GitGutter,Startified,LanguageClientStarted call SetStatusLine()
  autocmd InsertLeave * call s:hi('MyCurFname', [236, 140], [89, ''])
  autocmd InsertEnter,InsertChange * call s:InsertStatuslineColor(v:insertmode)
  autocmd BufWinEnter,ShellCmdPost,BufWritePost * call SetStatusLine()
  autocmd FileChangedShellPost,ColorScheme * call SetStatusLine()
  autocmd FileReadPre,ShellCmdPost,FileWritePost * call SetStatusLine()
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()  " vista 插件
augroup end
endif


" === vim-gitgutter ===
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_set_sign_backgrounds = 1