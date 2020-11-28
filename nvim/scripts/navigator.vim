"
" ,--.   ,--.,--.           ,--.                   
" |  |   |  |`--',--,--,  ,-|  | ,---. ,--.   ,--. 
" |  |.'.|  |,--.|      \' .-. || .-. ||  |.'.|  | 
" |   ,'.   ||  ||  ||  |\ `-' |' '-' '|   .'.   | 
" '--'   '--'`--'`--''--' `---'  `---' '--'   '--' 
"                                                 

" 使用 <leader> + k/j/h/l 在 windows 之间移动焦点
" map <LEADER>w <C-w>w
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
" 在 terminal 模式下有同样的行为
" tnoremap <LEADER>w <C-\><C-n><C-w>w
tnoremap <LEADER>k <C-\><C-n><C-w>k
tnoremap <LEADER>j <C-\><C-n><C-w>j
tnoremap <LEADER>h <C-\><C-n><C-w>h
tnoremap <LEADER>l <C-\><C-n><C-w>l

" Disabling the default s key
" nnoremap s <nop>

" 新建一个水平分割的窗口，放置当前窗口下方 / :sp
" nnoremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
" 新建一个水平分割的窗口，放置当前窗口上方
" nnoremap sk :set splitbelow<CR>:split<CR>
" 新建一个垂直分割的窗口，放置在当前窗口左侧
" nnoremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
" 新建一个垂直分割的窗口，放置在当前窗口右侧 / :vs
" nnoremap sl :set splitright<CR>:vsplit<CR>

" 将两个窗口切换为上下布局
nnoremap <leader>ww <C-w>t<C-w>K
" 将两个窗口切换为左右布局
nnoremap <leader>wv <C-w>t<C-w>H

" Rotate screens
nnoremap <leader>wrw <C-w>b<C-w>K
nnoremap <leader>wrv <C-w>b<C-w>H

" closs window
nnoremap <leader>wc <C-w>c<CR>
tnoremap <leader>wc <C-\><C-n><C-w>c<CR>
" 只保留当前窗口
nnoremap <leader>wo <C-w>o<CR>


" 使用上下左右调整 window 大小
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
" 在 terminal 模式下 调整 窗口大小
" tnoremap <up> <C-\><C-n>:res +5<CR>
" tnoremap <down> <C-\><C-n>:res -5<CR>
" tnoremap <left> <C-\><C-n>:vertical resize-5<CR>
" tnoremap <right> <C-\><C-n>:vertical resize+5<CR>


"                                 
" ,--------.       ,--.           
" '--.  .--',--,--.|  |-.  ,---.  
"    |  |  ' ,-.  || .-. '(  .-'  
"    |  |  \ '-'  || `-' |.-'  `) 
"    `--'   `--`--' `---' `----'  
"                                 

" 创建一个新的空白标签页，后面跟文件名则打开该文件
map tn :tabedit<CR>
" 切换到上一个tabs
map [t :tabprevious<CR>
" 切换到下一个tabs
map ]t :tabnext<CR>
" Move the tabs
map [mt :-tabmove<CR>
map ]mt :+tabmove<CR>
" Close tab
map <leader>tc :tabclose<CR>


"                                             
" ,-----.           ,---. ,---.               
" |  |) /_ ,--.,--./  .-'/  .-' ,---. ,--.--. 
" |  .-.  \|  ||  ||  `-,|  `-,| .-. :|  .--' 
" |  '--' /'  ''  '|  .-'|  .-'\   --.|  |    
" `------'  `----' `--'  `--'   `----'`--'    
"                                             

" 切换到上一个 buffer
nnoremap ]b :bn!<CR>
" 切换到下一个 buffer
nnoremap [b :bp!<CR>
" 切换到第一个buffer
nnoremap [B :bfirst!<CR>
" 切换到最后一个buffer
nnoremap ]B :blast!<CR>
" 关闭当前tab 并自动切换到上一个buffer
function! CloseCurBuffer() abort 
  " 记录当前的buffer
  let t:cbuff=bufnr("%")
  " 如果上一个buffer不为0 且存在的话, 切换到上一个打开buffer，否则直接切换上一个buffer
  exec g:prev_buffer_nr != 0 && bufloaded(g:prev_buffer_nr) ? 'b! ' . g:prev_buffer_nr : 'bp!'
  exec "bd! ". t:cbuff
  if len(getbufinfo({'buflisted':1})) == 1 && bufname() == ''|q|endif
endfunction
nnoremap <leader>bc :call CloseCurBuffer()<CR> 
