" ================
" Zee's VIM config
" ================


set nocompatible              " be iMproved
filetype off                  " required!


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


filetype plugin indent on     " required!


"""""""""""""""""""""""""""""""""""""""""""
" Automatically source vimrc file on save "
" a.k.a instantly update settings on save "
"""""""""""""""""""""""""""""""""""""""""""
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source %
augroup END " }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut for copying to the clipboard                       "
" (use this to yank to the clipboard)                         "
" CTRL + C                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <C-c> "+y


"""""""""""""""""""""""""""""""""""""""""""""""
" Shorcuts for going to previous and next tab "
" (in mac vim)                                "
"""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_macvim') 
    map <D-Left> :tabprev<CR>
    map <D-Right> :tabnext<CR>
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


"""""""""""""""""""""""""
" Font size declaration "
"""""""""""""""""""""""""
if has("gui_running")
    set guifont=Consolas:h15
endif


""""""""""""""""
" Color scheme "
""""""""""""""""
set background=dark     " Assume a dark background
colorscheme Tomorrow-Night



