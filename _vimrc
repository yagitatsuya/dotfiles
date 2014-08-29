set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mattn/emmet-vim'

" 
" JavaScript
" 
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'vim-scripts/jQuery'
NeoBundleLazy 'jelera/vim-javascript-syntax',{'autoload':{'filetypes':['javascript']}}
NeoBundle 'scrooloose/syntastic'

"
" Scala
"
NeoBundle 'derekwyatt/vim-scala.git'
  

filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundleCheck

set clipboard+=unnamed
set tabstop=4
set expandtab
set shiftwidth=4
set directory=~/.vim/tmp
" set paste
set backspace=start,eol,indent
set backupdir=~/.vim/tmp

nnoremap Y y$

" 
" neocomplete setting
"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'scala' : $HOME . '/.vim/dict/scala.dict',
            \ }


"
" syntastic
"
let g:syntastic_javascript_checker = "jshint"

"
" NERDTree
"
nmap <silent> <C-e> :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc> :NERDTreeToggle<CR>
omap <silent> <C-e> :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeShowHidden=1

"
" syntastic
" 
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \ 'active_filetypes': ['javascript'],
            \ 'passive_filetypes': ['html']
            \}
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jshint']

"
" ctags
" 
set tags=~/.tags
