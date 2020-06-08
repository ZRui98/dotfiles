call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'lilydjwg/colorizer'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
" Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

set hidden
set updatetime=300
set nobackup
set nowritebackup
set cmdheight=2
set number
syntax on
colorscheme peachpuff
filetype on
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype typescriptreact setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascriptreact setlocal ts=2 sw=2 sts=2 expandtab
" set noswapfile
" autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

set clipboard=unnamedplus
set backspace=indent,eol,start
set t_Co=256
set guicursor=
set foldmethod=indent
set foldlevel=100
map <F8> gg=G
inoremap jk <Esc> 
inoremap kj <Esc> 
noremap<F2> :set number!<CR>
noremap<F3> :set relativenumber!<CR>
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"
let g:tex_flavor = "latex"
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Custom colorscheme for lightline"
source /home/ciguatera/.config/vim/newthing.vim
set statusline+=%{fugitive#statusline()}
set laststatus=2
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'newthing',
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
function! LightlineLinterWarnings()
	let info = get(b:, 'coc_diagnostic_info', {})
	return has_key(info, 'warning') ? info['warning'] != 0 ? printf('%d  ', info['warning']) : '' : ''
endfunction

function! LightlineLinterErrors()
	let info = get(b:, 'coc_diagnostic_info', {})
	return has_key(info, 'error') ? info['error'] != 0 ? printf('%d  ', info['error']) : '' : ''
endfunction

function! LightlineLinterOK()
	let info = get(b:, 'coc_diagnostic_info', {})
	if empty(info)
		return ' '
	endif
	let sum = info['error'] + info['warning']
	return sum <= 0 ? ' ' : ''
endfunction

autocmd User CocDiagnosticChange call lightline#update()

" let g:ale_list_window_size = 4
" let g:ale_lint_on_save=1
" let g:ale_lint_on_text_changed='never'
" let g:ale_sign_error='●'
" nmap <silent> <leader>aj :ALENext<cr>
" nmap <silent> <leader>ak :ALEPrevious<cr>
" let g:ale_linters = {'rust' :['rls']}
" let g:ale_rust_rls_executable = '/home/ciguatera/.cargo/bin/rls'
" let b:ale_linters = ['rls']
" let g:ale_rust_rls_executable = 'ra_lsp_server'
" let b:ale_fixers = ['rustfmt']
" let g:ale_completion_enabled = 1

let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsSnippetsDir=$HOME.'/UltiSnips'
let g:UltiSnipsSnippetDir=["~/.vim/plugged/vim-snippets/UltiSnips"]
let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/vim-snippets/UltiSnips"]

let g:indentLine_char = '▏'
let g:indentLine_color_term = 151
let g:indentLine_setConceal = 2
autocmd Filetype json let g:indentLine_enabled = 0

"nvim
hi! Statement ctermfg=2
hi! vimHighlight ctermfg=3
hi Visual term=none cterm=none ctermbg=238
hi Search term=none cterm=none ctermbg=238
hi SignColumn cterm=none ctermbg=none
" hi Folded ctermbg=4 ctermfg=15
" hi ErrorMsg cterm=none ctermbg=none ctermfg=1
" hi Search cterm=none ctermbg=187
hi LineNr ctermfg=7
hi vimLet ctermfg=3
" hi texMath ctermfg=10
let g:tex_conceal = ""
call lightline#update()

" coc-nvim
let g:coc_node_path = '/home/ciguatera/.asdf/shims/node'
hi Pmenu ctermbg=237 ctermfg=7
hi PmenuSel ctermbg=237 ctermfg=9
hi! CocErrorSign ctermfg=1
hi! CocInfoSign ctermfg=2
hi! CocWarningSign ctermfg=3
" tex
hi texMathZoneX ctermfg=1
hi texSection ctermfg=6
" ts
hi typescriptImport ctermfg=3
hi typescriptCall ctermfg=3
hi typescriptInterfaceName ctermfg=9
hi typescriptTypeReference ctermfg=9
hi typescriptVariable ctermfg=5
hi jsxBraces ctermfg=7
" python
hi! pythonClassVar ctermfg=3

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

let g:polyglot_disabled = ['latex']
let g:java_highlight_functions=1
