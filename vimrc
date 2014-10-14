execute pathogen#infect()
syntax on
filetype plugin indent on

autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:airline#extensions#tabline#enabled = 1

colorscheme lucario

"Setting line numbers
set number

"Setting indenting
set expandtab
set shiftwidth=2
set softtabstop=2

"Setting autoindent
set ai

"Setting smart indent
set smartindent

"Setting cursorline
set cursorline
