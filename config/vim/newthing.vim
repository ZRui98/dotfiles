let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ 15, 2  ], [ 7, 8  ]  ]
let s:p.normal.middle = [ [ 15, 8  ]  ]
let s:p.normal.right = [ [ 2, 8 ],[ 4, 1  ]  ]
let s:p.insert.left = [ [ 15, 3  ], [ 7, 8  ]  ]
let s:p.replace.left = [ [ 15, 1  ], [ 7, 8  ]  ]
let s:p.visual.left = [ [ 15, 4  ], [ 7, 8  ]  ]
let s:p.normal.error = [ [ 1, 8  ]  ]
let s:p.normal.warning = [ [ 3, 8  ]  ]

let g:lightline#colorscheme#newthing#palette = lightline#colorscheme#fill(s:p)
