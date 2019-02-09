let mapleader=','

nnoremap <F3> :set hlsearch!<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


set nocompatible
set encoding=utf-8
set history=50
set nospell

" Vim pathogen
" execute pathogen#infect()


" Indenting
set autoindent
set cindent
set smartindent

" Tab
set expandtab
set sw=4
set ts=4

set backspace=indent,eol,start
set cursorline
set colorcolumn=80
set nu
set ruler
set showcmd
syntax on
" set background=dark
" colorscheme solarized
" colorscheme peachpuff

set hlsearch
set incsearch
set showmatch

" Binding

nmap <Leader>E :NERDTreeToggle<CR>
nmap <Leader>p :set paste!<CR>i
nmap <Leader>s :source $MYVIMRC<CR>
nmap <Leader>v :e $MYVIMRC<CR>
nmap <C-N> :next<CR>
nmap <C-B> :prev<CR>

filetype plugin indent on
autocmd FileType text setlocal textwidth=78
autocmd BufNewFile,BufRead *.jinja,*.jinja2 set ft=sls
autocmd BufWritePre * :%s/\s\+$//e

" Python
autocmd FileType python nmap <Leader>r :!python %<CR>
autocmd FileType python nmap <Leader># ggO#!/usr/bin/env python2<CR># -*- coding: utf-8 -*-<Esc>o
autocmd FileType python nmap <Leader>m Giif __name__ == "__main__":<CR>
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Shell
autocmd FileType sh nmap <Leader>r :!bash %<CR>
autocmd FileType sh nmap <Leader># ggO#!/bin/bash<Esc>o


" Ctags
let Tlist_WinWidth = 55
map T :TaskList<CR>
" D stands for def
map D :TlistToggle<CR>

" For simple status bar
function! GitBranch()
    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    if branch != ''
        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
    en
    return ''
endfunction

function! CurDir()
    return substitute(getcwd(), expand("$HOME"), "~", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

function! HasFlake()
    if !exists("*Flake8()") && executable('flake8')
        return ''
    endif
    return 'NO'
endfunction

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}\ FLAKE:%{HasFlake()}
if !exists("*Flake8()") && executable('flake8')
    autocmd BufWritePost *.py call Flake8()
endif


"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

imap jk <esc>

set pastetoggle=<F2>


filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle 'ervandew/supertab'


call vundle#end()
filetype plugin indent on

set splitbelow
set splitright

set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1


let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

map <leader>e :CtrlP .<CR>

