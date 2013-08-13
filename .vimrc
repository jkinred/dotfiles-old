set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'ervandew/supertab'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/pep8'
Bundle 'rodjek/vim-puppet'
Bundle 'godlygeek/tabular'
Bundle 'embear/vim-gnupg'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'benmills/vimux'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'olethanh/Vim-nosecompiler'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'jkinred/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
"Bundle 'sjbach/lusty'
"Bundle 'wincent/Command-T'
"Bundle 'Rykka/riv.vim'


" Tagbar isn't supported on vim < 7.0.167
"if v:version == 700 && !has('patch167')
"    call add(g:pathogen_disabled, 'tagbar')
"    nnoremap <leader>l :TlistToggle<CR>
"else
"    call add(g:pathogen_disabled, 'taglist')
"    nnoremap <leader>l :TagbarToggle<CR>
"endif
"
"" Disable Taglist if executable not present
"if !executable('ctags')
"    call add(g:pathogen_disabled, 'taglist')
"endif
"
"if has("python")
"" Disable pyflakes if Python version is < 2.5
"python << EOF
"import vim
"import os.path
"import sys
"if sys.version_info[:2] < (2, 5):
"    vim.command("call add(g:pathogen_disabled, 'pyflakes-pathogen')")
"EOF
"endif

let mapleader=","

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

"colorscheme candycode
"colorscheme desert256
"colorscheme fruity
"colorscheme inkpot
"colorscheme railscasts

set background=dark
set t_Co=16
colorscheme solarized
"colorscheme molokai

set wildmode=longest:full
set wildmenu
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a            " Enable mouse usage (all modes)
set cursorline          " Underline the current line
set ls=2                " Show the statusline at the bottom
set history=111         " Restore 111 things from viminfo
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{fugitive#statusline()}%#ErrorMsg#%{SyntasticStatuslineFlag()}%*%=%-14.(%l,%c%V%)\ %P
set viminfo=\"4,'4,/111,:111,h,f0
"            |  |  |    |    | +file marks 0-9,A-Z 0=NOT stored
"            |  |  |    |    +disable 'hlsearch' loading viminfo
"            |  |  |    +command-line history saved
"            |  |  +search history saved
"            |  +files marks saved
"            +lines saved each register (old name for <, vi6.2)
"
if &t_Co > 2 || has("gui_running")
  syntax on
endif

set showmode
set hlsearch

set expandtab
"set textwidth=79
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

" Tagbar
" ------
let g:tagbar_autofocus = 1

" NERDTree
" --------
let NERDTreeIgnore = ['\.pyc$']

" Python
" ------
autocmd FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview
let g:SuperTabDefaultCompletionType = "context"
"Highlight as error when chars go past column 79
autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType python match OverLength /\%80v.*/
autocmd FileType python compiler nose
autocmd FileType python set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent

" Ruby
" ------
autocmd FileType ruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent

" HTML
" ----
autocmd FileType htmldjango set expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd FileType rst setlocal spell spelllang=en_au
autocmd FileType text setlocal spell spelllang=en_au

" Generic key bindings
" Use space for folding
nnoremap <space> za
vnoremap <space> zf
" Toggle line numbers
nnoremap <F3> :set nonumber!<CR>:set foldcolumn=0<CR>
" Toggle paste mode
set pastetoggle=<F2>
" Navigate left and right between windows
map <C-h> <C-w>h
map <C-l> <C-w>l
" Turn off search highlighting
nmap <silent> <Leader>/ :nohlsearch<CR>
" Navigate quickfix errors
nnoremap cn :cnext<CR>
noremap cp :cprevious<CR>
nnoremap qf :cwindow<CR>
nnoremap <Leader>j :b#<CR>

" Key bindings for addons
" Bring up the task list
map T <Plug>TaskList
"map <Leader>b :LustyBufferExplorer<CR>
map <Leader>b :CtrlPBuffer<CR>
map <Leader>d :TagbarToggle<CR>
map <Leader>m :call VimuxRunCommand("
map <Leader>mm :VimuxRunLastCommand<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>g :LAck! 

let g:ctrlp_map = '<Leader>t'

" XML editing options
autocmd FileType xml set tabstop=2
autocmd FileType xml set shiftwidth=2
autocmd FileType xml set softtabstop=2

if has("gui_running")
    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
endif

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class
let g:ctrlp_custom_ignore = { 'dir': 'target\|itam' }
" Display punctuation marks for cleaner code
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" Keep at least two lines of context at top and bottom of screen
set scrolloff=2

autocmd FileType *
\ if &omnifunc != '' |
\   call SuperTabChain(&omnifunc, "<c-p>") |
\   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
\ endif

let g:pyflakes_use_quickfix = 0
