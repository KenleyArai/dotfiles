call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'

" Colors
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'chriskempson/base16-vim'

" Edit
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/vimproc.vim', { 'do:' : 'make' }
Plug 'scrooloose/syntastic'

" Visual
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'

" Movement
Plug 'Lokaltog/vim-easymotion'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'

call plug#end()

"----------------------------------------[Basic settings]----------------------------------------

"--------[Sensible]--------
runtime! plugin/sensible.vim


let python_highlight_all=1

set mouse=""
set noshowmode
set expandtab smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
nnoremap <space> za
" Plugin on indent on filetype detection on
filetype plugin indent on

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

set encoding=utf-8
scriptencoding utf-8

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set clipboard=unnamed
set formatoptions-=cro

"Return cursor to previous position on load
autocmd BufReadPost * normal `""`

set lazyredraw
let g:mapleader=","

if exists('$TMUX')
  set term=screen-256color
endif

if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

set nu
set autoindent
set smartindent
set backspace=indent,eol,start

"Changing movement to be like emacs
nmap <C-e> $
nmap <C-a> ^
vmap <C-e> $
vmap <C-a> ^
imap <C-e> <ESC>$a
imap <C-a> <ESC>^i

" Jump multiple lines
nnoremap J 10j
nnoremap K 10k
xnoremap J 10j
xnoremap K 10k

" move vertically by visual line
nnoremap j gj
nnoremap k gk

set showbreak=⇇

"Adding newlines without entering insert mode
nmap O O<Esc>
nmap o o<Esc>k

" Exit insert with esc
inoremap jj <Esc>

" Save .swp and backups to a more sane place
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Because I close vim sometimes
set undofile
set undolevels=1000
set undoreload=10000

"---------------------------------------[Plugin Settings]----------------------------------------

"--------[IndentLine]--------
let g:indentLine_char = '¦'


"--------[EasyMotion]--------
" Disable default mapping
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0

"---------[tcomment]--------
vmap <Leader>c :TComment<CR>
nmap <Leader>c :TComment<CR>

"--------[Tmuxline]--------
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

"--------[Airline]--------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1

"--------[RainbowParen]--------
au VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['"', '"']]
let g:rainbow#max_level = 16

"--------[tmux-navigator]--------
let g:tmux_navigator_save_on_switch = 1

"--------[tmuxline]--------
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}

"--------[Syntastic]--------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Python support
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_quiet_messages = { "type": "style" }

" C++ support
let g:syntastic_cpp_compiler = 'clang++'
" C++11 support
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:syntastic_c_check_header = 1
let g:syntastic_c_remove_include_errors = 1
