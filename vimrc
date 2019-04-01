set number
syntax on
filetype on
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

set clipboard=unnamedplus
set backspace=indent,eol,start
set t_Co=256
set guicursor=
set foldmethod=indent
set foldlevel=100
inoremap jk <Esc> 
inoremap kj <Esc> 
noremap<F2> :set number!<CR>
noremap<F3> :set relativenumber!<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"
let g:tex_flavor = "latex"
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Custom colorscheme for lightline
source /home/ciguatera/.config/nixpkgs/lustre.vim
set statusline+=%{fugitive#statusline()}
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'lustre',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['gitbranch','filename', 'modified']],
  \   'right': [ ['linter_ok'], ['linter_warnings'], ['linter_errors'],['readonly'], ['lineinfo'], ['percent'] ]
  \ },
  \ 'component_expand': {
  \   'linter_warnings': 'LightlineLinterWarnings',
  \   'linter_errors': 'LightlineLinterErrors',
  \   'linter_ok': 'LightlineLinterOK'
  \ },
  \ 'component_type': {
  \   'readonly': 'error',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error'
  \ },
  \ 'component_function':{
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

" Solution by github.com/maximbaz
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : ''
endfunction

autocmd User ALELintPost call lightline#update()
 
let g:ale_list_window_size = 4
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed='never'
hi ALEWarningSign ctermfg=10 ctermbg=none
let g:ale_sign_warning='●'
hi ALEErrorSign ctermfg=1 ctermbg=none
let g:ale_sign_error='●'
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir=$HOME.'/UltiSnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/UltiSnips']

let g:indentLine_char = '▏'
let g:indentLine_color_term = 151
let g:indentLine_setConceal = 2
autocmd Filetype json let g:indentLine_enabled = 0

hi Visual term=none cterm=none ctermbg=187
hi SignColumn cterm=none ctermbg=none
hi Folded ctermbg=4 ctermfg=15
hi ErrorMsg cterm=none ctermbg=none ctermfg=1
hi Search cterm=none ctermbg=187
hi LineNr ctermfg=10
hi Statement ctermfg=8
hi texMath ctermfg=10
let g:tex_conceal = ""
call lightline#update()
