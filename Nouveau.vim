"""""""""""""""""""""""""
"  Nouveau Colorscheme  "
"""""""""""""""""""""""""
"Modified version of Tomorrow colorscheme by itchyny

let s:base03 = '#fafafa'
let s:base023 = '#dfdfdf'
let s:base02 = '#c6c6c6'
let s:base01 = '#b4b4b4'
let s:base0 = '#666666'
let s:base2 = '#4f4f4f'
let s:red = '#c82829'
let s:yellow = '#D9C26C'
let s:green = '#97DA98'
let s:turquoise = '#75D7D7'
let s:turqdark = '#99C4C4'
let s:gray = '#F0F0F0'
let s:pink = '#E4A9A7'
let s:white ='#FFFFFF'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:white, s:turquoise ], [s:green, s:gray ] ]
let s:p.normal.right = [ [ s:white, s:base0 ], [ '#555555', s:turqdark ] ]
let s:p.inactive.right = [ [ s:base02, s:base0 ], [ s:base0, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base0, s:base02 ], [ s:base0, s:base03 ] ]
let s:p.insert.left = [ [ s:white, s:yellow ], [ s:green, s:gray ] ]
let s:p.replace.left = [ [ s:base02, s:red ], [ '#4d4d4c', s:gray ] ]
let s:p.visual.left = [ [ s:white, s:pink ], [ s:green, s:gray ] ]
let s:p.normal.middle = [ [ s:white, s:yellow ] ]
let s:p.insert.middle = [ [ s:white, s:pink ] ]
let s:p.visual.middle = [ [ s:white, s:turquoise ] ]
let s:p.inactive.middle = [ [ s:base0, s:base02 ] ]
let s:p.tabline.left = [ [ s:base2, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base2, s:base023 ] ]
let s:p.tabline.middle = [ [ s:base01, s:base0 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:red, s:base01 ] ]
let s:p.normal.warning = [ [ s:yellow, s:base0 ] ]

let g:lightline#colorscheme#Nouveau#palette = lightline#colorscheme#fill(s:p)
