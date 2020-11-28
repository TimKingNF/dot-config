" === markdown-preview.nvim ===

" options for markdown render
" mkit: markdown-it options for render
" katex: katex 参数
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: 取消同步滚动，设置为1
" sync_scroll_type: 'middle', 'top' 或者 'relative', 默认值 'middle'
"   middle: 意味着光标的位置总是显示在预览页面的中间
"   top: 光标位置始终在预览页面顶部
"   relative: 光标位置显示在预览页面的相对位置
" hide_yaml_meta: 隐藏 yaml 元数据， default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: 不显示文件名, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 1
    \ }

" 指定 markdown css 路径
let g:mkdp_markdown_css = '/Users/alen/Library/Application Support/abnerworks.Typora/themes/vue.css'


" === vim-table-mode === 
nmap <leader>tm :TableModeToggle<CR>