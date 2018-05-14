set nocompatible
filetype off
set encoding=UTF-8
set diffopt+=vertical

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins that need to load first
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'

Plugin 'altercation/vim-colors-solarized'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'hashivim/vim-terraform'
Plugin 'jamessan/vim-gnupg'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mileszs/ack.vim'
Plugin 'nerdtree-ack'
Plugin 'plasticboy/vim-markdown'
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/syntastic'
Plugin 'thanethomson/vim-jenkinsfile'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/TaskList.vim'

" Plugins on trial
Plugin 'airblade/vim-gitgutter'
"Plugin 'davidhalter/jedi-vim'
Plugin 'gcmt/taboo.vim'
Plugin 'gregsexton/gitv'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'yggdroot/indentline'

" Useful plugins which are only occasionally needed
"Plugin 'fatih/vim-go'
"Plugin 'rodjek/vim-puppet'
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'jkinred/snipmate-snippets'
"Plugin 'garbas/vim-snipmate'
"Plugin 'Lokaltog/vim-easymotion'

" Plugins that have to be loaded last
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on


let mapleader=","

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

set directory=$HOME/.vim/swapfiles//

set background=dark
colorscheme solarized

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

"
" GPG
" ---
let g:GPGExecutable = "gpg2 --trust-model always"

" Tagbar
" ------
let g:tagbar_autofocus = 1

" NERDTree
" --------
let NERDTreeIgnore = ['.*\.egg-info', '__pycache__', '\.pyc$', '\.pyo$', '\.class$']

" Python
" ------
autocmd FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview
let g:SuperTabDefaultCompletionType = "context"
"Highlight as error when chars go past column 79
"autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"autocmd FileType python match OverLength /\%80v.*/
"autocmd FileType python compiler nose
"autocmd FileType python set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent

" Ruby
" ------
autocmd FileType ruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent

" HTML
" ----
autocmd FileType htmldjango set expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent

" YAML
" ----
"autocmd FileType yaml set expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd FileType rst setlocal spell spelllang=en_au
autocmd FileType text setlocal spell spelllang=en_au

autocmd BufNewFile,BufRead *.gradle setf groovy

" Generic key bindings
" Use space for folding
nnoremap <space> za
vnoremap <space> zf
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
map <Leader>t :TagbarToggle<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>g :Ack! 
map <Leader>b :CtrlPBuffer<CR>
map <Leader>f :CtrlP<CR>

" XML editing options
autocmd FileType xml set tabstop=2
autocmd FileType xml set shiftwidth=2
autocmd FileType xml set softtabstop=2

" Go editing options
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
autocmd Filetype go setlocal nolist
autocmd Filetype go let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](target|public)' }
let g:ctrlp_working_path_mode = 0

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

autocmd QuickFixCmdPost *grep* cwindow

" Markdown configuration
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

" Toggle paste mode
set pastetoggle=<F2>

" Toggle line numbers
map <F3> :set nonumber!<CR>:set foldcolumn=0<CR>

" Toggle background between light and dark
map <F4> :let &background = ( &background == "dark"? "light" : "dark")<CR>
"call togglebg#map("<F4>")

" Turn off line indent indicators
map <F5> :IndentLinesToggle<CR>

" Jenkinsfile
au BufNewFile,BufRead Jenkinsfile* set filetype=groovy
autocmd FileType groovy set expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent

" Ensure YouCompleteMe uses the virtualenv interpreter
let g:ycm_python_binary_path = 'python'

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

nnoremap <silent> <F6> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
let g:tlTokenList = ["FIXME", "TODO", "XXX", "NOTE"]
