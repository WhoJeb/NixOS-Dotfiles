" Vim Config File "
" Should be placed in home folder "

packadd! dracula
syntax enable
colorscheme dracula

" Enable Mouse Support "
set mouse=a

" Enable Syntax "
syntax on

" Enable Line Numbers"
set relativenumber

" Highlight Current Line "
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

" Enable Highlight search pattern "
set hlsearch

" Enable Smartcase Search Sensitivity "
set ignorecase
set smartcase

" Indentation Using Spaces "
" tabstop:	width of tab character
" softtabstop:	fine tunes the amount of whitespace to be added
" shiftwidth:	determines the amount of whitespace to add in normal mode
" expandtab:	when on use space instead of tab
" textwidth:	text wrap width
" autoindent:	autoindent in new line
set tabstop =2
set softtabstop =2
set shiftwidth =2
set expandtab
set autoindent

" Show The Matching Pairs Of {}, [], () "
set showmatch

" remove trailing whitespace from Python and files "
autocmd BufWritePre *.py :%s/\s\+$//e

" Status Line "
set laststatus=2

"Left side"
set statusline+=\ [
set statusline+=\ %F
set statusline+=\ %m
set statusline+=\ ]

set statusline+=%=

"Right Side"
set statusline+=\ <<
set statusline+=\ Line:\ %l,
set statusline+=\ Col:\ %c
set statusline+=\ >>


" enable color themes "
if !has('gui_running')
	set t_Co=256
endif

" enable true colors support "
set termguicolors

" Transparent BG
hi Normal guibg=NONE ctermbg=NONE

