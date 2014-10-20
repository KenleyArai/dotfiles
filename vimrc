execute pathogen#infect()
syntax on
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1

colorscheme lucario

"Setting line numbers
set number

"Setting indenting
set expandtab
set shiftwidth=2
set softtabstop=2

set backspace=indent,eol,start

"Setting autoindent
set ai

"Setting smart indent
set smartindent

"Setting cursorline
set cursorline

let g:clang_library_path="/usr/lib/llvm-3.4/lib"
let g:ycm_global_ycm_extra_conf = '/home/kenley/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
