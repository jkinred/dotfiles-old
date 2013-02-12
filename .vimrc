set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

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
Bundle 'sjbach/lusty'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wincent/Command-T'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Rykka/riv.vim'

if !has("ruby")
    let g:LustyJugglerSuppressRubyWarning = 1
endif

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
"
"call pathogen#infect()
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
set viminfo=%,\"4,'4,/111,:111,h,f0
"           |  |  |  |    |    | +file marks 0-9,A-Z 0=NOT stored
"           |  |  |  |    |    +disable 'hlsearch' loading viminfo
"           |  |  |  |    +command-line history saved
"           |  |  |  +search history saved
"           |  |  +files marks saved
"           |  +lines saved each register (old name for <, vi6.2)
"           +save/restore buffer list
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
set autoindent
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

" MiniBufExpl
" -----------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.

" --------------------
" TagList
" --------------------
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40

" Tagbar
" ------
let g:tagbar_autofocus = 1

" Python
" ------
autocmd FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview
let g:SuperTabDefaultCompletionType = "context"
"Highlight as error when chars go past column 79
autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType python match OverLength /\%80v.*/

" Ruby
" ------
autocmd FileType ruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd FileType rst setlocal spell spelllang=en_au
autocmd FileType text setlocal spell spelllang=en_au

" Generic key bindings
nnoremap <space> za
vnoremap <space> zf
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set pastetoggle=<F3>
map T <Plug>TaskList
map <Leader>b :LustyBufferExplorer<CR>
map <Leader>m :call VimuxRunCommand("

" XML editing options 
autocmd FileType xml set tabstop=2
autocmd FileType xml set shiftwidth=2
autocmd FileType xml set softtabstop=2

if has("gui_running")
    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
endif
