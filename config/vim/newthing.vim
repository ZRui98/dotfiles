" =============================================================================
" " Filename: autoload/lightline/colorscheme/PaperColor_light.vim
" " Author: TKNGUE
" " License: MIT License
" " Last Change: 2015/07/28 07:46:40.
" "
" =============================================================================


let s:normal = '#88aa55'
let s:white = '#eeeeee'
let s:insert = '#CCB05F'
let s:bg = '#556973'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ 15, 4  ], [ 7, 8  ]  ]
let s:p.normal.middle = [ [ 7, 8  ]  ]
let s:p.normal.right = [ [ 2, 4 ],[ 4, 1  ]  ]
let s:p.insert.left = [ [ 15, 3  ], [ 7, 8  ]  ]
let s:p.replace.left = [ [ 15, 1  ], [ 7, 8  ]  ]
let s:p.visual.left = [ [ 15, 2  ], [ 7, 8  ]  ]
let s:p.normal.error = [ [ 1, 4  ]  ]
let s:p.normal.warning = [ [ 179, 4  ]  ]

let g:lightline#colorscheme#newthing#palette = lightline#colorscheme#fill(s:p)
