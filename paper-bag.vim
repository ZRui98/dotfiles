" =============================================================================
" Filename: autoload/lightline/colorscheme/PaperColor_light.vim
" Author: TKNGUE
" License: MIT License
" Last Change: 2015/07/28 07:46:40.
" =============================================================================


let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ 230, 2 ], [ 108, 187 ] ]
let s:p.normal.right = [ [ 108, 187],[ 187, 1 ] ]
let s:p.normal.middle = [ [ 230, 8 ] ]
let s:p.insert.left = [ [ 230, 10 ], [ 108, 187 ] ]
let s:p.replace.left = [ [ 230, 1 ], [ 108, 187 ] ]
let s:p.visual.left = [ [ 230, 12 ], [ 108, 187 ] ]
let s:p.normal.error = [ [ 1, 187 ] ]
let s:p.normal.warning = [ [ 179, 187 ] ]

let g:lightline#colorscheme#lustre#palette = lightline#colorscheme#fill(s:p)
