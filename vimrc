" Vimrc that keeps me from ending it all.

" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" NerdTree
Plugin 'scrooloose/nerdtree'
" For supercollider vim
Plugin 'sbl/scvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}


" Leader {{{
let mapleader=","           " leader is comma
" }}}


" Basics {{{
syntax on
set shell=bash
" disable folding, idk why this is default
set nofoldenable
" source vimrc
nnoremap <leader>s :call RunCmd("source", $MYVIMRC)<CR>
" }}}


" UI Config {{{
" show line numbers
set number
" toggle line numbers
nnoremap <leader>l :call ToggleCmd("number")<CR>
" toggle relative numbers
noremap <leader>r :call ToggleCmd("relativenumber")<CR>

set colorcolumn=80
" show matching ([{}])
set showmatch
" wrap text
set wrap
" highlight search results
set hlsearch
" highlight trailing spaces
highlight TrailingSpace ctermbg=red guibg=red
match TrailingSpace /\s\+$/
" }}} UI Config


" TODO clean these up
" Tabs and Spaces {{{
" show existing tab with 4 spaces width
set tabstop=4
" number of spaces inserted/deleted while editing
set softtabstop=4
" On pressing tab, insert 4 spaces
set expandtab
" an indent is 4 spaces
set shiftwidth=4
" round to nearest multiple of shiftwidth
set shiftround
" highlight Tabs
highlight Tabs ctermbg=238
match Tabs /\t/
" toggle expandtab
nnoremap <leader>t :call ToggleCmd("expandtab")<CR>
" toggle paste
nnoremap <leader>p :call ToggleCmd("paste")<CR>
" display full path of file
nnoremap <leader>c :echo expand('%:p')<CR>

filetype indent on
filetype plugin on
set autoindent              " auto indent
set smartindent             " smart indent

set backspace=indent,eol,start " backspace over everything in insert mode
" }}}


" Movement {{{
" move vertically by visual line (not line number)
nnoremap j gj
nnoremap k gk
set mouse=

" Enable/disable mouse (useful for copy paste to/from terminal window)
nnoremap <leader>m :call ToggleMouse()<CR>


" move between windows sensibly
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
" Movement }}}


" Utils {{{
" example: on 'test.cpp', use `:e H` to open 'test.h'
cnoreabbrev H %<.h
cnoreabbrev HPP %<.hpp
cnoreabbrev CPP %<.cpp

" Show diff between buffer and last savedfile
cnoreabbrev df :w !diff % -

" search down into sub folders for file tasks, use :find to search
set path+=**

" Open vimrc for a quick looksy
cnoreabbrev moi :sp $MYVIMRC

" Abbreviate ff to find file
cnoreabbrev ff find
" Utils }}}


" Windows and Tabs {{{
" new horizontal splits go below
set splitbelow
" new vertival splits go right
set splitright

" Vertical means panes will be stacked vertically, similarly for horizontal
nnoremap <leader>v :sp<CR>
nnoremap <leader>h :vsp<CR>

" Resizing windows
nnoremap <leader>= <C-w>=
nnoremap <F12> <C-w>+
nnoremap <F11> <C-w>-
nnoremap <F10> <C-w>>
nnoremap <F9> <C-w><
" Windows and Tabs }}}

" Plugin configuration below this line
" -----------------------------------------------------

" nerdTree {{{
nmap <silent> <leader>f :NERDTreeToggle<cr>
let NERDTreeDirArrows=0
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='~'
" }}}

" Run command and display with variables expanded
if exists("*RunCmd") == 0
    function! RunCmd(...)
        let cmd = join(a:000, ' ')
        exec cmd
        echo cmd
    endfunction
endif

if exists("*ToggleCmd") == 0
    function! ToggleCmd(val)
        exec "set ".a:val."!"
        exec "let cur=&".a:val
        if cur
            echo a:val." mode ON"
        else
            echo a:val." mode OFF"
        endif
    endfunction
endif

function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        echo "mouse mode OFF"
    else
        set mouse=a
        echo "mouse mode ON"
    endif
endfunction
