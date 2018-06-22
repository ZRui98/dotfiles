    " Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
syn match  cAmpersand	    "&"
syn match  cVertical	    "|"
syn match  cShiftRight	    ">>"
syn match  cShiftLeft	    "<<"
syn match  cAsterisk	    "*"
syn match  cPlus	    "+"
syn match  cDash	    "-"
syn match  cForward	    "/"
syn match  cArrow	    "->"

hi def link cCustomFunc  Function
hi def link cCustomClass Function
hi def cAmpersand	 ctermfg=13
hi def cVertical	 ctermfg=13
hi def cShiftRight	 ctermfg=13
hi def cShiftLeft	 ctermfg=13
hi def cAsterisk	 ctermfg=13
hi def cPlus		 ctermfg=13
hi def cDash		 ctermfg=13
hi def cForward		 ctermfg=13
hi def cArrow		 ctermfg=13
