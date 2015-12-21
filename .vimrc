"{{{  basic setting
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

filetype on
filetype plugin indent on     " required!
filetype indent on

"==================================================================
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.erb set filetype=html

"==================================================================
"}}}
"{{{  key bind setting
"C-w
nnoremap <Space>w <C-w><C-w>
nnoremap <Space>n <C-w>n
nnoremap <Space>b :bNext<CR>
nnoremap <Space>t :tabNext<CR>
nnoremap <Space>> 3<C-W>>
nnoremap <Space>< 3<C-W><
nnoremap <Space>+ 3<C-W>+
nnoremap <Space>- 3<C-W>-
if has("win32")
	nnoremap <Space>r :e ~/_vimrc<CR>
    else
    	nnoremap <Space>r :e ~/.vimrc<CR>
        endif

" <TAB>: completion.                                         
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"   
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
" highlight off

nmap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
"}}}
"{{{ neobundle
if !1 | finish | endif
if has('vim_starting')
	if &compatible
    		set nocompatible               " Be iMproved
            	endif

	" Required:
    	set runtimepath+=~/.vim/bundle/neobundle.vim/
        endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
"originalrepos on github
let g:neobundle_default_git_protocol='https'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
                  \     'cygwin' : 'make -f make_cygwin.mak',
                        \     'mac' : 'make -f make_mac.mak',
                              \     'unix' : 'make -f make_unix.mak',
                                    \    },
                                          \ }

NeoBundle 'Shougo/neocomplete'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle "scrooloose/syntastic"
NeoBundle 'tell-k/vim-autopep8'
NeoBundleLazy 'vim-jp/cpp-vim', {
	\ 'autoload' : {'filetypes':'cpp'}
    	\}
        NeoBundleLazy 'vim-scripts/Python-Syntax-Folding', {
        	\ 'autoload' : {'filetypes' : 'python'}
            	\ }
                NeoBundleLazy 'davidhalter/jedi-vim', {
                	\ 'autoload' : {'filetypes' : 'python'}
                    	\ }
                        NeoBundleLazy 'tomasr/molokai'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
call neobundle#end()

" Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"}}}
" {{{ Completion
" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
    endif

" eclim (for C++, Java)
let g:neocomplete#force_omni_input_patterns.java = '\%(\h\w*\|)\)\.\w*'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t].\w*'
autocmd FileType java,cpp let g:EclimCompletionMethod = 'omnifunc'
"
" jedi-vim (for python)
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setl completeopt-=preview
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" }}}
"{{{others

"Unite vim 
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
" Neosnippet

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
                                                        				\'command' : 'g++',
                                                                        				\'cmdopt' : '-std=c++11 -lboost_system'
                                                                                        				\}
                                                                                                        	"'cmdopt' : '-std=c++11 `pkg-config --cflags opencv` `pkg-config --libs opencv` -lshogun -lboost_system -lboost_serialization -lboost_python -lpython -lboost_thread-mt -lboost_system'
                                                                                                            	let g:quickrun_config.tex = {
                                                                                                                				\   'command' : 'latexmk',
                                                                                                                                				\   'exec': ['%c -gg -pdfdvi %s']
                                                                                                                                                				\}
                                                                                                                                                                endif

".vimrc.local
set path=.,/usr/include,/usr/local/include
if filereadable('./.vimrc.local')
  source ./.vimrc.local
  endif

"}}}
" {{{ language
" 80字超えたら警告
autocmd FileType php,python execute "set colorcolumn=" . join(range(81, 9999), ',')
" タブ文字規則など
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4 listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
autocmd FileType php setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType ruby setl tabstop=2 expandtab shiftwidth=2 softtabstop=2 autoindent
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ["flake8"]
"
" php
let php_folding=1
" }}}
