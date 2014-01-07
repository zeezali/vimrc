
" ================
" Zee's Vim config
" ================



" ========================
" ========================
" =====   GENERAL   ======
" ========================
" ========================

" be iMproved
set nocompatible

" required
filetype off
filetype plugin on
filetype indent on

" syntax highlighting
syntax on

" store a ton of history (default is 20)
set history=1000

" allow for cursor beyond last character
set virtualedit=onemore

" allow buffer switching without saving
set hidden 

" set to auto read when a file is changed from the outside
set autoread

" switch to the current file directory when a new buffer is opened
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" utf8
scriptencoding utf-8


" persistent undo
if has('persistent_undo')

    set undofile                

    " maximum number of changes that can be undone
    set undolevels=1000          

    " maximum number lines to save for undo on a buffer reload
    set undoreload=10000

endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Restore cursor to file position in previous editing session "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END


"""""""""""""""""""""""""""""""""""""""""""
" Automatically source vimrc file on save "
" a.k.a instantly update settings on save "
"""""""""""""""""""""""""""""""""""""""""""
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source %
augroup END " }


""""""""""""""""""""""""""""""""""""""""""
" Setup centralised backup directory     "
" // at the end prevents name collisions "
" (backups in one place)                 "
""""""""""""""""""""""""""""""""""""""""""
set backupdir=$HOME/.vim/vim-backups/backups//
set directory=$HOME/.vim/vim-backups/swaps//

" persistent undo directory
set undodir=$HOME/.vim/vim-backups/undos//





" =======================
" =======================
" =====   PLUGINS   =====
" =======================
" =======================

""""""""""
" Vundle "
""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"""""""""""
" Bundles "
"""""""""""
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

Bundle 'tpope/vim-surround'

Bundle 'Raimondi/delimitMate'

Bundle 'mattn/emmet-vim'

Bundle 'loremipsum'

" HTML
Bundle 'amirh/HTML-AutoCloseTag'

Bundle 'othree/html5.vim'

Bundle 'gcmt/breeze.vim'

" Javascript
Bundle "pangloss/vim-javascript"



" ===========================
" ===========================
" ===== PLUGIN SETTINGS =====
" ===========================
" ===========================

" enables HTML/CSS syntax highlighting in js files
let javascript_enable_domhtmlcss=1

" only use emmet in html + css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall



" ===========================
" ===========================
" =====   FORMATTING   ======
" ===========================
" ===========================

" use spaces instead of tabs
set expandtab

" smart tabs
set smarttab

" smart indents
set smartindent

" auto indent
set autoindent

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces  

" puts new vsplit windows to the right of the current
set splitright  

" puts new split windows to the bottom of the current
set splitbelow

" pastetoggle (sane indentation on pastes)
set pastetoggle=<leader>p

" visual wrapping (wrap lines visually, not physically)
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0




" ===================
" ===================
" =====   UI   ======
" ===================
" ===================

" color scheme
set background=dark         " assume a dark background
colorscheme Tomorrow-Night


" font size  
if has("gui_running")
    set guifont=Consolas:h15
endif


" display the current mode
set showmode  

" highlight current line
set cursorline 


" ruler
if has('cmdline_info')
    set ruler                   
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd                 
endif


" status line
if has('statusline')
    set laststatus=2

    set statusline=%<%f\                     
    set statusline+=%w%h%m%r                 
    " set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            
    set statusline+=\ [%{getcwd()}]          
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  
endif


" normal backspace
set backspace=indent,eol,start


" line numbers on
set nu

" configure line number coloring
if has("gui_running")
    highlight CursorLineNr guifg=#555b63
endif

" show matching brackets
set showmatch

" find as you type search
set incsearch 

" highlight search terms
set hlsearch

" case insenstive search
set ignorecase

" case sensitive when uc present
set smartcase 

" enhanced command line completion
set wildmenu

" auto fold code
set foldenable 

" add script tag to html syntax
syn keyword htmlTagName contained script



" =============================
" =============================
" =====   KEY MAPPINGS   ======
" =============================
" =============================

"""""""""""""""""""""
" Map <leader> to , "
""""""""""""""""""" "
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>


""""""""""""""""""""""""""""""""""""""""""
" Shortcut for copying to the clipboard  "
" (use this to yank to the clipboard)    "
" CTRL + C                               "
""""""""""""""""""""""""""""""""""""""""""
vnoremap <C-c> "+y


"""""""""""""""""""""""""""""""""""""""""""""""
" Shorcuts for going to previous and next tab "
" (in mac vim)                                "
"""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_macvim') 
    map <D-[> :tabprev<CR>
    map <D-]> :tabnext<CR>
endif


"""""""""""""""""""""""""""""""
" Move easier between windows "
"""""""""""""""""""""""""""""""
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l



""""""""""""""""""""""""""""""""""""""""""
" Move up and down even on wrapped lines "
""""""""""""""""""""""""""""""""""""""""""
map j gj
map k gk


"""""""""""""""""""""""""""""""""""""""" "
" Shortcuts for moving lines up and down "
" (shifting lines up and down)           "
""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert a new line without entering insert mode "
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>


""""""""""""""""""
" Spell checking "
""""""""""""""""""
" pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


""""""""""""""""""""""""""""""""""""""
" Toggle highlighted searches on/off "
""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>/ :set invhlsearch<CR>


"""""""""""""""""""""""
" Emmet trigger combo "
" , e                 "
"""""""""""""""""""""""
autocmd FileType html,css,scss imap <expr> <leader>e emmet#expandAbbrIntelligent("\<tab>")







