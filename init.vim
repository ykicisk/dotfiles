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

let loaded_matchparen = 1

filetype on
" filetype plugin indent on     " required!
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
nnoremap <Space>r :e ~/.config/nvim/init.vim<CR>

" <TAB>: completion.                                         
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"   
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
" highlight off

nmap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
"}}}
"{{{ dein.vim
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim/dein'))

" Let dein manage dein
" Required:
call dein#add('rhysd/nyaovim-markdown-preview')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/vimproc', {'build': 'make'})
call dein#add('glidenote/memolist.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('Shougo/neomru.vim')
call dein#add('plasticboy/vim-markdown')
call dein#add('Konfekt/FastFold')
call dein#add('tpope/vim-fugitive')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
call dein#add("scrooloose/syntastic")
call dein#add('tell-k/vim-autopep8')
call dein#add('vim-jp/cpp-vim', {
	\ 'autoload' : {'filetypes':'cpp'}
	\ })
call dein#add('vim-scripts/Python-Syntax-Folding', {
	\ 'autoload' : {'filetypes' : 'python'}
	\ })
call dein#add('Vimjas/vim-python-pep8-indent', {
	\ 'autoload' : {'filetypes' : 'python'}
	\ })
"
" call dein#add('davidhalter/jedi-vim', { 'autoload' : {'filetypes' : 'python'} })
call dein#add('zchee/deoplete-jedi')
call dein#add('tomasr/molokai', {'lasy': 1})
call dein#add('scrooloose/nerdtree')
call dein#add('airblade/vim-gitgutter')

call dein#end()

filetype plugin indent on

if dein#check_install()
    call dein#install()
endif

"}}}
" {{{ Completion
" deoplete
let g:deoplete#enable_at_startup = 1

" jedi-vim (for python)
" autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setl completeopt-=preview
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" }}}
"{{{others

"Quick Run
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

let g:memolist_memo_suffix = "md"

".vimrc.local
set path=.,/usr/include,/usr/local/include
if filereadable('./.vimrc.local')
  source ./.vimrc.local
endif

" nyaovim
let g:markdown_preview_eager=1
let g:markdown_preview_auto = 1

" denite
nmap <Space>d :Denite file_rec -highlight-mode-insert=Search<CR>

nmap <Space>f :NERDTreeToggle<CR>

"}}}
" {{{ language
" 80字超えたら警告
autocmd FileType php,python execute "set colorcolumn=" . join(range(81, 9999), ',')
" タブ文字規則など
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4 listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
autocmd FileType php setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType cpp setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ["flake8"]
"
" php
let php_folding=1
" }}}
