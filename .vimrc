
"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"

" General Settings
" -------------------------------------------------
syntax enable    " Syntax Highlight
syntax on

set t_Co=256    " Color depth
set cul         " Cursor Highlight
set number        " Show line number on the side
set ruler         " Show current line/col number and relative position at the bottom

set linespace=0    " Spacing between lines (only works for gVim)
set confirm        " if quit & save fail confirmation pop
set showmatch    " Show parens (maybe)
set report=0    " Always show the number of line yanke/deleted

set noeb        " Disable beeping
set cmdheight=1
set showcmd         " Show commands typed
set scrolloff=3     " Show 3 lines after the cursor when scrolling
set laststatus=2    " Always show the status line

set noswapfile    " Backup files    
set nobackup
set autoread    " Re-load files that have been modified
set autowrite    " Auto save when window lose focus

set matchtime=1
set magic  


" GUI options
" -------------------------------------------------
set guifont=Monospace\ 10 " pick a patched font
set guioptions-=T           
set guioptions-=m   


" Helpful shortcuts
" -------------------------------------------------
set backspace=2    " Backspace works as it should
set mouse=a        " Enable Mouse for all modes

" ctrl-c: copy
vmap <C-c> "+yi

" ctrl-x: cut
vmap <C-x> "+c

" ctrl-v: paste
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" ctrl-s: Save
vmap <C-s> <ESC>:update<CR>gv
imap <C-s> <c-o>:update<CR>
nmap <C-s> :update<CR>


" ctrl-S: Save ALL/Save and quit/Save and remove trailling white space

" ctrl-z: undo
nmap <C-z> :u<CR> 

" ctrl-y : redo
vmap <C-y> <C-R><CR>

" ctrl-f: find
" vmap <C-f> *

" ctrl-=: find and replace
" vmap <C-=> s


" ctrl-a: select a line
" vmap <C-a> 

" ctrl-A: select the whole document
" vmap <C-a> ggVG

vmap <Tab> >><CR>
vmap <S-Tab> <<<CR>
command Q :q


" Misc
" -------------------------------------------------
set shortmess=atI   
set history=1000    " Command history
set ignorecase        " Search ignore case 
set hlsearch        " Highlight search
set incsearch        " Search the text as the pattern is written  
autocmd InsertEnter * se cul  

" Indentation
" -------------------------------------------------
set autoindent
set smartindent
set cindent
set cinoptions=g0,:0,N-s,(0
set tabstop=4        " Tab size in number of spaces
set softtabstop=4
set shiftwidth=4
set expandtab        " insert spaces instead of tabs
set smarttab

set wildmenu        " Auto-completion context menu
 
set completeopt=preview,menu    
set whichwrap+=<,>,h,l
set selection=exclusive
set selectmode=mouse,key
set fillchars=vert:\ ,stl:\ ,stlnc:\
set completeopt=longest,menu
set iskeyword+=.

" Language and encoding
" -------------------------------------------------

set langmenu=en_US.UTF-8
set helplang=en
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8

filetype on    " detect the type of file to load highlight and stuff
filetype plugin on
filetype indent on

" Default file
" -------------------------------------------------

autocmd BufNewFile *.cpp,*.cc,*.c,*.hpp,*.h,*.sh,*.py exec ":call SetTitle()" 
func SetTitle() 
    if expand("%:e") == 'sh'
    call setline(1,"\#!/bin/bash") 
    call append(line("."), "") 
    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 
    elseif expand("%:e") == 'h'
    call setline(1, "#pragma once")
    elseif expand("%:e") == 'hpp'
    call setline(1, "#pragma once")
    endif
endfunc 
autocmd BufNewFile * normal G

" Vundle
" -------------------------------------------------

set nocompatible        " Allow Arrow keys              
filetype off            " Vundle stuff

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Airline - Pretty Arrow (Very useful)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'L9'

Plugin 'chxuan/change-colorscheme'

" Multiline commenter/uncomment 
Plugin 'scrooloose/nerdcommenter'

" File system window
Plugin 'scrooloose/nerdtree'

" Auto completion
Plugin 'Valloric/YouCompleteMe'

" Auto pairs bracket
" Plugin 'jiangmiao/auto-pairs'

" HTML stuff 
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Highlight closing tags
Plugin 'Valloric/MatchTagAlways'

" insert close tag
Plugin 'docunext/closetag.vim'

" Indent multi line 
Plugin 'godlygeek/tabular'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Enable to modify surrounding bracket/quote
Plugin 'tpope/vim-surround'

" Multiline comments what about nerdcommenter
Plugin 'tpope/vim-commentary'

" Better repeat command
Plugin 'tpope/vim-repeat'

" Helper to end tags for some languages
Plugin 'tpope/vim-endwise'

Plugin 'ctrlpvim/ctrlp.vim'

" Class browser 
Plugin 'majutsushi/tagbar'

" exactly what it says
Plugin 'octol/vim-cpp-enhanced-highlight'

" switch between header and source files
Plugin 'vim-scripts/a.vim'

"Plugin 'vim-scripts/DoxygenToolkit.vim'
"Plugin 'vim-scripts/SQLComplete.vim'

" Txt file highlighting
Plugin 'vim-scripts/txt.vim'

" Pretty icons
Plugin 'ryanoasis/vim-devicons'

" Show HEX color in text
Plugin 'gorodinskiy/vim-coloresque'

" Directory diff 
" Plugin 'will133/vim-dirdiff'

" Incremental Search
Plugin 'haya14busa/incsearch.vim'

" Useless starting window
Plugin 'mhinz/vim-startify'

call vundle#end()            
filetype plugin indent on    


" Colorscheme
" -------------------------------------------------
set background=dark
let g:solarized_termcolors=256
colorscheme solarized    "colorscheme monokai

" cpp_class_scope_highlight
" -------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error = 1


" Project Tree (nerdtree)
" -------------------------------------------------
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" Class Tree (tagbar)
" -------------------------------------------------
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
map <F4> :TagbarToggle<CR>
imap <F4> <ESC> :TagbarToggle<CR>


" Status Bar (airline)
" -------------------------------------------------
let g:airline_theme="luna"        " let g:airline_theme="badwolf"
let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Doxygen
" -------------------------------------------------
let g:DoxygenToolkit_authorName="Delaunay, Pierre.delaunay@hec.ca"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_commentType="Qt"


" Auto complete (YouCompleteMe)
" -------------------------------------------------
let g:ycm_confirm_extra_conf = 0 
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_complete_in_comments = 1 
let g:ycm_complete_in_strings = 1 
"let g:ycm_cache_omnifunc = 0 
let mapleader = ","
nnoremap <leader>u :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>i :YcmCompleter GoToDefinition<CR>
nnoremap <leader>o :YcmCompleter GoToInclude<CR>
nmap <F5> :YcmDiags<CR>


" ctags
" ``````````````
set tags+=/usr/include/tags
set tags+=~/.vim/systags
set tags+=~/.vim/x86_64-linux-gnu-systags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers = {} 
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&',']']

" a.vim: .h -> .cpp or .cpp -> .h
nnoremap <silent> <F2> :A<CR>




" load vim default plugin
"runtime macros/matchit.vim

" change-colorscheme
"map <F10> :NextColorScheme<CR>
"imap <F10> <ESC> :NextColorScheme<CR>
"map <F9> :PreviousColorScheme<CR>
"imap <F9> <ESC> :PreviousColorScheme<CR>

" ctrlp
"let g:ctrlp_map = '<c-f>'
"let g:ctrlp_cmd = ':CtrlP'
"let g:ctrlp_working_path_mode = '0'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" incsearch.vim
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

"nnoremap <C-N> :bn<CR>
"nnoremap <C-P> :bp<CR>
