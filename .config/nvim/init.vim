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
" set foldmethod=marker
" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set wildmode=list:full
set listchars=tab:>-
set list
" highlight SpecialKey guifg=#BBBBBB
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
" Delete Tool & Menu Bar
" set guioptions-=T
" set guioptions-=m
" BufferList
" nmap gb :ls<CR>:buf 
" カッコの対応をわかりやすくする
set sm
" カーソル送りに関する設定
" set whichwrap+=<
" set whichwrap+=>
" set whichwrap+=[
" set whichwrap+=]
" set whichwrap+=h
" set whichwrap+=l
" ステータス行
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
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

"{{{ filetype
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.erb set filetype=html
"}}}
"{{{  key bind setting
nnoremap <Space>b :bNext<CR>
nnoremap <Space>tm :TableModeToggle<CR>
let g:table_mode_delete_column_map = '<Space>tc'
nnoremap <Space>r :e ~/.config/nvim/init.vim<CR>
" <TAB>: completion.                                         
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"   
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
nmap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
"}}}


call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kannokanno/previm'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tomasr/molokai', {'lasy': 1}
Plug 'glidenote/memolist.vim'
call plug#end()
