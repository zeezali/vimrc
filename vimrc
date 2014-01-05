
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

" utf8
scriptencoding utf-8


"""""""""""""""""""""""""""""""""""""""""""
" Automatically source vimrc file on save "
" a.k.a instantly update settings on save "
"""""""""""""""""""""""""""""""""""""""""""
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source %
augroup END " }


""""""""""""""""""""""""""""""""""""""""""
" Setup backup directory                 "
" // at the end prevents name collisions "
" (backups in one place)                 "
""""""""""""""""""""""""""""""""""""""""""
set backupdir=$HOME/.vim/vim-backups/backups//
set directory=$HOME/.vim/vim-backups/swaps//



" ===========================
" ===========================
" =====   FORMATTING   ======
" ===========================
" ===========================

" Use spaces instead of tabs
set expandtab

" Smart tabs
set smarttab

" Smart indents
set smartindent

" Auto indent
set autoindent

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces  

" Puts new vsplit windows to the right of the current
set splitright  

" Puts new split windows to the bottom of the current
set splitbelow

" pastetoggle (sane indentation on pastes)
set pastetoggle=<F12>


" ===================
" ===================
" =====   UI   ======
" ===================
" ===================

" Color scheme
set background=dark         " assume a dark background
colorscheme Tomorrow-Night


" Font size  
if has("gui_running")
    set guifont=Consolas:h16
endif




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

" Bundles
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}




" =============================
" =============================
" =====   KEY MAPPINGS   ======
" =============================
" =============================

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





