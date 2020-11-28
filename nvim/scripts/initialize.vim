" ===
" === Auto load for first time uses
" === 打开 nvim 自动安装插件管理器 Plug
" ===
if empty(glob(printf('%s/autoload/plug.vim', g:nvim_home)))
  silent !curl -fLo ${NVIM_HOME}/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter *.vim PlugInstall --sync | source $MYVIMRC
endif

" ===
" === 创建 undo 所需要的文件夹
" ===
if !isdirectory(printf('%s/tmp', g:nvim_home))
  silent !mkdir -p ${NVIM_HOME}/tmp/backup
  silent !mkdir -p ${NVIM_HOME}/tmp/undo
endif