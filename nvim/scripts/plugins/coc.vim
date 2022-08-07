" coc 扩展，执行 :CocInstall 安装
" * coc 市场，用于搜索 :CocList marketplace
let g:coc_global_extensions = [ 
  \ 'coc-marketplace',
\]


" === Mappings ===
" 显示Coc诊断信息
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" 列出Coc所有插件
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" 列出Coc所有命令
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>


" === coc-bookmark ===
" 添加书签，需要填写备注
nmap <leader>bm <Plug>(coc-bookmark-annotate)
" 书签列表
nmap <leader>bl :CocList bookmark<CR>