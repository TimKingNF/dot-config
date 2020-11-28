" === vim-cheat40 ===
" 不使用默认的快捷键手册
let g:cheat40_use_default = 0


" === vim-startify ===
map <LEADER>st :Startify<CR>
" 配置页面显示列表，参考：https://github.com/mhinz/vim-startify/wiki/Example-configurations
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]


