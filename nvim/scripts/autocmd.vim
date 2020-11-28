"                                                         
"   ,---.            ,--.                            ,--. 
"  /  O  \ ,--.,--.,-'  '-. ,---.  ,---.,--,--,--. ,-|  | 
" |  .-.  ||  ||  |'-.  .-'| .-. || .--'|        |' .-. | 
" |  | |  |'  ''  '  |  |  ' '-' '\ `--.|  |  |  |\ `-' | 
" `--' `--' `----'   `--'   `---'  `---'`--`--`--' `---'  
"                                                         
" 执行命令以及钩子, 还有注册函数等

" === 清除高亮 ===
exec "nohlsearch"


" TODO: 注册一个函数。vim 内部比较文件 
" :vert diffsplit filename


" === 自动切换中英文输入法 ===
" 需要依赖工具: 请在 machine.vim 指定 select-tools 路径
" https://github.com/daipeihust/im-select#installation
" curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh
" 获取当前输入法: im-select
" 切换输入法: im-select com.apple.keylayout.US
function! RecoverNormalInputMethod() abort
  " 兼容一下，在打开一个空目录文件的时候，先执行创建目录
  let s:dir = expand("%:p:h")
  if exists('g:vscode')
    " 需要移除 file://
    let s:dir=s:dir[7:-1]
  endif
  if !empty(s:dir) && !isdirectory(s:dir)
    call mkdir(s:dir, "p")
  endif
  silent exec "!" . g:im_select_tools . " com.apple.keylayout.US"
endfunction
" 离开插入模式, vim获得焦点时都自动切换输入法 到 abc
autocmd InsertLeave,FocusGained * silent :call RecoverNormalInputMethod()


" === JsonFormat ===
command! JsonFormat :execute 
  \ '%!python -c "import json,sys; sys.stdout.write(json.dumps(json.loads(sys.stdin.read()), indent=2, ensure_ascii=0))"'


" === Compile function ===
nmap <C-B> :call CompileRunGcc()<CR>
function! CompileRunGcc() abort
  " 先保存当前文件
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %< && time %<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++2a % -Wall -o %<"
    :sp
    :res -15
    :terminal ./%<
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java -enableassertions %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    exec "!python3 %"
  elseif &filetype == 'php'
    exec "!php %"
  elseif &filetype == 'html'
    silent! exec "!chromium % &"
  elseif &filetype == 'markdown'
    " 需要 iamcco/markdown-preview.nvim 插件支持
    exec "MarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run %
  endif
endfunction


" === Filetypedetect ===
augroup filetypedetect
  " au! BufRead proxy.pac setfiletype javascript
  " au! BufRead */c++/* call s:CheckCPP()  " 如果路径中含有 c++
augroup END


" === Auto ===
aug MyAutocmd
  " 在执行该命令组的命令之前，先清除所有自动命令
  au!
  " 如果只剩最后一个窗口，并且该窗口是 quickfix，那么就自动退出vim
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
  " 记录上一个buffer的id
  au BufLeave * let g:prev_buffer_nr=bufnr("%")
  " 设置打开文件时恢复光标所在
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " 打开终端自动切换到插入模式
  autocmd TermOpen term://* startinsert
aug END