call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/rainbow_parentheses.vim'

" Edit
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'rizzatti/dash.vim'
Plug 'lervag/vim-latex'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'


" Visual
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'edkolev/promptline.vim'

" Movement
Plug 'Lokaltog/vim-easymotion'
Plug 'bkad/CamelCaseMotion'

" Git
Plug 'airblade/vim-gitgutter'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" Latex
Plug 'xuhdev/vim-latex-live-preview'

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

" No Vi compatibility mode
set nocompatible

" Plugin on indent on filetype detection on
filetype plugin indent on

set encoding=utf-8
scriptencoding utf-8

syntax on
set background=light
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
nmap <C-a> ^
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

" disable folding
set nofoldenable

" Exit insert with esc
inoremap jk <Esc>

nnoremap ! :!
nnoremap ; :
nnoremap : ;

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

"--------[Neocomplete]--------
let g:acp_enableAtStartup = 0

let g:neocomplete#enable_at_startup = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-y>" : "\<TAB>"

"--------[neosnippet]---------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"--------[EasyMotion]--------
" Disable default mapping
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s)

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
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1

"--------[RainbowParen]--------
au VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['"', '"']]
let g:rainbow#max_level = 16

"--------[tmux-navigator]--------
let g:tmux_navigator_save_on_switch = 1

"--------[Latex Live Preview]--------
autocmd Filetype tex setl updatetime=5000
let g:livepreview_previewer = 'open -a Skim'

"--------[Align]--------
vnoremap <silent> <Enter> :EasyAlign<cr>

"--------[Promptline]--------
let g:promptline_theme = 'airline'
let g:promptline_preset = {
        \'a'    : [ '$USER' ],
        \'b'    : [ promptline#slices#cwd() ],
        \'c'    : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'z'    : [ promptline#slices#host() ]}

"--------[Syntastic]--------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_quiet_messages = { "type": "style" }


"--------[Nerdtree]--------
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
