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
" }}}


" UI Config {{{
" show line numbers
set number
" toggle line numbers
nnoremap <leader>l :setlocal number!<CR>
" toggle relative numbers
nnoremap <leader>r :set relativenumber!<CR>

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
" show tabs as T>>>
highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>

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
set mouse=a

" Enable/disable mouse (useful for copy paste to/from terminal window)
nnoremap <leader>m :set mouse=a<CR>
nnoremap <leader>n :set mouse=<CR>

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


" Not really useful, just keeping here for reference.
" c++ boilerplate {{{
function H_Header(programName)
    let s:line=line(".")
    let s:filename=expand('%:t')
    let s:flag=toupper(a:programName . "_" . expand('%:t:r')) . "_H"

    call setline(s:line,"/*")
    call append(s:line," * @file " . s:filename)
    call append(s:line+1," */")
    call append(s:line+2,"")
    call append(s:line+3,"#ifndef" . " " . s:flag)
    call append(s:line+4,"#define" . " " . s:flag)
    call append(s:line+5,"")
    call append(s:line+6,"#endif")
    unlet s:flag
    unlet s:filename
    unlet s:line
endfunction

command! -nargs=1 Headerh execute H_Header(<q-args>)
" }}}


" Plugins Below this line
" -----------------------------------------------------

" nerdTree {{{
nmap <silent> <leader>f :NERDTreeToggle<cr>
let NERDTreeDirArrows=0
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='~'
" }}}
