execute pathogen#infect()

filetype plugin indent on

"-------------Non-Plugin settings-----------

syntax enable
"set foldmethod=syntax
colorscheme badwolf 

"Setting line numbers
set number

"Changing movement to be like bash
map <C-e> $
map <C-a> 0^
imap <C-e> <ESC>$a
imap <C-a> <ESC>0^i

"Yanking a single line
map <C-y> 0v$y^
imap <C-y> <ESC>0v$y^i

"Moving down a single line even if wrapped
nnoremap j gj
nnoremap k gk
"imap <Up> g<Up>
"imap <Down> g<Down>

"Adding newlines without entering insert mode
nmap O O<Esc>
nmap o o<Esc>k
imap <C-o> <Esc>oi
imap <C-O> <Esc>Oi

"Setting indenting
set expandtab
set shiftwidth=4
set softtabstop=4

"Setting leader
let mapleader=","
set timeout timeoutlen=1500

"Fixing backspace issues
set backspace=indent,eol,start

"Setting autoindent
set ai

"Setting smart indent
set smartindent

"Setting cursorline
set cursorline

"Forcing me to use hjkl for movement
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Movement between screens
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>



"-------------Plugin settings------------

"----Tagbar
nmap <F8> :TagbarToggle<CR>
autocmd FileType c,cpp nested :TagbarOpen

"----Easymotion
let g:EasyMotion_smartcase = 1

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"----Indent guides
let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}

hi def IndentGuides guibg=#303030 ctermbg=234

call IndentGuides()

"----Rainbow paren
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"----Lightline
set guifont=Inconsolata\ for\ powerline:h1
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

"----Syntastic
let g:syntastic_cpp_check_header = 1

"----Multi-Cursor
let g:multi_cursor_use_default_mapping=0

" Map start key separately from next key
let g:multi_cursor_start_key='<C-m>'

" Default mapping
let g:multi_cursor_next_key = '<C-m>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

"----Tabular
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> = =<Esc>:call <SID>ealign()<CR>a
function! s:ealign()
    let p = '^.*=\s.*$'
    if exists(':Tabularize') && getline('.') =~# '^.*=' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^=]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*=\s*\zs.*'))
        Tabularize/=/l1
        normal! 0
        call search(repeat('[^=]*=',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction 


"----Neocomplecache
let g:clang_library_path = '/usr/lib/llvm-3.4/lib/libclang.so'

if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c        = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp      = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc     = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objcpp   = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:clang_complete_auto                        = 0
let g:clang_auto_select                          = 0
let g:clang_use_library                          = 1
let g:neocomplcache_enable_at_startup            = 1
let g:neocomplcache_enable_smart_case            = 1
let g:neocomplcache_min_syntax_length            = 3
                                                 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"----Bad-Wolf settings
let g:badwolf_darkgutter = 1
" Make the tab line darker than the background.
let g:badwolf_tabline = 0

