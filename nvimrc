call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-sensible'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/rainbow_parentheses.vim'

" Edit
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'

" Easing my retardation
Plug 'junegunn/vim-easy-align'
Plug 'benekastah/neomake'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Visual
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'edkolev/promptline.vim'

" Movement
Plug 'Lokaltog/vim-easymotion'

" Git
Plug 'airblade/vim-gitgutter'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'epeli/slimux'


call plug#end()

"----------------------------------------[Basic settings]----------------------------------------

"--------[Sensible]--------
runtime! plugin/sensible.vim
set mouse=""
set noshowmode
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" Plugin on indent on filetype detection on
filetype plugin indent on

set encoding=utf-8
scriptencoding utf-8

set background=dark
colorscheme solarized

set clipboard=unnamed
set formatoptions-=cro

"Return cursor to previous position on load
autocmd BufReadPost * normal `""`

augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

let g:mapleader=","

"Changing movement to be like emacs
nmap <C-e> $
vmap <C-e> $
vmap <C-a> ^
imap <C-e> <ESC>$a
imap <C-a> <ESC>^i

" Jump multiple lines
nnoremap J 15j
nnoremap K 15k
xnoremap J 15j
xnoremap K 15k

" move vertically by visual line
nnoremap j gj
nnoremap k gk

set showbreak=⇇

"Adding newlines without entering insert mode
nmap O O<Esc>
nmap o o<Esc>k

" Sign Column made by solarized color is strange, clear it.
highlight clear SignColumn
" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()"

" Autosave when leaving insertmode
autocmd InsertLeave * if expand('%') != '' | update | endif

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

" Removes trailing spaces on write
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" Exit insert with esc
inoremap jj <Esc>

nnoremap ! :!
nnoremap ; :
nnoremap : ;

" Save .swp and backups to a more sane place
set backupdir=~/.nvim/backup//
set directory=~/.nvim/swap//
set undodir=~/.nvim/undo//

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
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1

"--------[RainbowParen]--------
au VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['"', '"']]
let g:rainbow#max_level = 16

"--------[tmux-navigator]--------
let g:tmux_navigator_save_on_switch = 1

"--------[Align]--------
" Press enter and select what to align
vnoremap <silent> <Enter> :EasyAlign<cr>

"--------[Promptline]--------
let g:promptline_theme = 'airline'
let g:promptline_preset = {
        \'a'    : [ '$USER' ],
        \'b'    : [ promptline#slices#cwd() ],
        \'c'    : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'z'    : [ promptline#slices#host() ]}

"--------[neomake]--------
autocmd! BufWritePost * Neomake
let g:neomake_airline = 1

"--------[tmuxline]--------
let g:tmux_navigator_save_on_switch = 1

"--------[YouCompleteme]--------
autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>

"--------[Slimux]--------
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
