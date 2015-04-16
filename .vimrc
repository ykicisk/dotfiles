" basic setting
"{{{
" color
syntax on
set background=dark
set t_Co=256
colorscheme molokai
" encoding
set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
" indent & row number
set number
set cindent
" foldmethod
set foldmethod=marker
" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set wildmode=list:full
set listchars=tab:>-
set list
highlight SpecialKey guifg=#BBBBBB
" visual bell off
set visualbell t_vb=
" search
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト 
" no swap & backup file
set nowritebackup
set nobackup
set noswapfile
set nocompatible
"Delete Tool & Menu Bar
set guioptions-=T
set guioptions-=m
" BufferList
nmap gb :ls<CR>:buf 
" カッコの対応をわかりやすくする
set sm
" カーソル送りに関する設定
set whichwrap+=<
set whichwrap+=>
set whichwrap+=[
set whichwrap+=]
set whichwrap+=h
set whichwrap+=l
" ステータス行
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" カーソル変化
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"
" ウィンドウ分割の方向を変える
set splitright
" カーソル形状がすぐに元に戻らないのでタイムアウト時間を調整
set ttimeoutlen=10
"clipboard
set clipboard+=unnamed

set wildmenu
set ruler
set showcmd
set title
set backspace=indent,eol,start
" スペルチェック
let spell_executable = "aspell"
let spell_language_list = "english"
highlight SpellErrors guifg=Red ctermbg=Red cterm=none
let spell_auto_type = ""

"==================================================================
"}}}
" key bind setting
"{{{
"comment
"C-w
nnoremap <Space>w <C-w><C-w>

nnoremap <C-k><C-c> gc

nnoremap <Space>n <C-w>n
nnoremap <Space>b :bNext<CR>
nnoremap <Space>t :tabNext<CR>
nnoremap <Space>> 3<C-W>>
nnoremap <Space>< 3<C-W><
nnoremap <Space>+ 3<C-W>+
nnoremap <Space>- 3<C-W>-
if has("win32")
	nnoremap <Space>r :e ~/_vimrc<CR>
	nnoremap <Space>s :source ~/_vimrc<CR>
else
	nnoremap <Space>z :e ~/.zshrc<CR>
	nnoremap <Space>r :e ~/.vimrc<CR>
	nnoremap <Space>s :source ~/.vimrc<CR>
endif
"nnoremap <Space>y :e ~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py<CR>

" <TAB>: completion.                                         
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"   
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
" highlight off
nmap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
"}}}
"==================================================================
" neobundle setting
"{{{
set nocompatible               " be iMproved
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle'))
endif
"originalrepos on github

let g:neobundle_default_git_protocol='https'
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell'

NeoBundleLazy 'Shougo/neocomplete', {
	\ 'autoload' : {'filetypes' : ['python','vim','zsh','xml','cpp','ruby','html','javascript']}
	\ }

NeoBundleLazy 'osyo-manga/vim-snowdrop', {
	\ 'autoload' : {'filetypes' : ['cpp']}
			\}

NeoBundleLazy 'osyo-manga/vim-marching', {
	\ 'autoload' : {'filetypes' : ['cpp']}
			\}

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'rking/ag.vim'
"NeoBundle 'tyru/caw.vim'
"NeoBundle 'tpope/vim-commentary'
"NeoBundle 'osyo-manga/vim-automatic'
"NeoBundle 'cohama/vim-smartinput'
"NeoBundle 'cohama/vim-smartinput-endwise'
"call smartinput_endwise#define_default_rules()

NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

NeoBundle 'jceb/vim-orgmode'


NeoBundleLazy 'vim-jp/cpp-vim', {
	\ 'autoload' : {'filetypes':'cpp'}
	\}
NeoBundleLazy 'davidhalter/jedi-vim', {
	\ 'autoload' : {'filetypes' : 'python'}
	\ }
NeoBundleLazy 'vim-scripts/Python-Syntax-Folding', {
	\ 'autoload' : {'filetypes' : 'python'}
	\ }
NeoBundleLazy 'tomasr/molokai'


"}}}
filetype on
filetype plugin indent on     " required!
filetype indent on
syntax on

"==================================================================

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1 
let g:neocomplete#enable_insert_char_pre = 1
"if !exists('g:neocomplete#force_omni_input_patterns')
"	let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.cpp = 
"	\  '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType coffee     setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
autocmd FileType c          setlocal omnifunc=ccomplete#Complete
autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.erb set filetype=html

"Unite vim 
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
" Neosnippet

"
"Quick Run
nnoremap [unite] <Nop>
" Makefileがあれば :makeをするなければQuickRun 
nmap <Space><F4> :make<CR>
nmap <Space><F5> :QuickRun<CR>
" C++はC++11でコンパイルする
if !exists("g:quickrun_config")
	let g:quickrun_config = {
				\   "_" : {
				\       "runner" : "vimproc",
				\       "runner/vimproc/updatetime" : 60 
				\   },
				\}
endif

if has("win32")
	let g:quickrun_config.cpp = {
				\'command' : 'g++',
				\'cmdopt' : '-std=c++11'
				\}
else
	let g:quickrun_config.cpp = {
				\'command' : 'clang++',
				\'cmdopt' : '-std=c++11 `pkg-config --cflags opencv` `pkg-config --libs opencv` -lshogun -lboost_system -lboost_serialization -lboost_python -lpython -lboost_thread-mt -lboost_system'
				\}
	let g:quickrun_config.tex = {
				\   'command' : 'latexmk',
				\   'exec': ['%c -gg -pdfdvi %s']
				\}
endif



" jedi-vim
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_select_first = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled=0

".vimrc.local
set path=.,/usr/include,/usr/local/include
if filereadable('./.vimrc.local')
  source ./.vimrc.local
endif

"caw # comment
nmap <C-k>c <Plug>(caw:I:toggle)
vmap <C-k>c <Plug>(caw:I:toggle)
nmap <C-k>u <Plug>(caw:I:uncomment)
vmap <C-k>u <Plug>(caw:I:uncomment)

let g:snowdrop#libclang_directory="/Library/Developer/CommandLineTools/usr/lib"
"let g:snowdrop#libclang_directory="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
let path_val=split(eval('&path'),',')
let new_path_val=[]
for p in path_val
	call add(new_path_val,fnamemodify(p,':p'))
endfor
let g:snowdrop#include_paths = {
			\'cpp' : ['/usr/local/include']+new_path_val
			\}
			"\'cpp' : ['/usr/local/include','/Users/iseki/Projects/hokosen/dataset/include']
			"\'cpp' : ['/usr/local/include']+new_path_val

let g:snowdrop#command_options = {
			\ "cpp" : "-std=c++11",
			\}
" Enable code completion in neocomplete.vim.
let g:neocomplete#sources#snowdrop#enable = 1
" Not skip
let g:neocomplete#skip_auto_completion_time = ""

"marching vim
let g:marching_backend="snowdrop"
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
			\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
