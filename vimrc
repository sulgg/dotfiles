"no compatibility with vi
set nocompatible

"disable file type detection but keep the flags for 'plugin' and 'indent' unchanged
filetype off

"enable syntax highlighting
syntax on

"Show line numbers
set number

"Highlight line at cursor
set cursorline

"--PLUGINS---------------------------------------------------------------------

"Plugins must be added before 'call vundle#end() and 'filetype plugin indent on

"Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'kshenoy/vim-signature'
Plugin 'Yggdroot/indentLine'

call vundle#end()

"--END_OF_PLUGINS--------------------------------------------------------------

"indent and plugin detection for filetypes
filetype plugin indent on

"Hide buffers when they are abandoned
set hidden

"Show (partial) command in status line
set showcmd

"Always display the statusline in all windows (required)
set laststatus=2

"Copy the indentation from the previous line
set autoindent

"Display of whitespaces and linebreaks
set listchars=tab:\|\ ,eol:¬

"Command-line completion operates in an enhanced mode
set wildmenu

"A longer line will be broken after white space to get this width
set textwidth=79

"clipboard commands between vim and linux gui
set clipboard=unnamedplus

"Do smart case matching
set smartcase

"Incremental search
set incsearch

"Select case-sensitiv search
set ignorecase

"highlight definitions (gd command, asterisk commmand)
set hlsearch

"Insert space characters whenever the tab key is pressed
set expandtab

"Inserts blanks according to 'shiftwidth'
set smarttab

"Number of space characters inserted when the tab key is pressed
set tabstop=4

"Number of spaces that a <Tab> counts for while editing operations
set softtabstop=4

"Change the number of space characters inserted for indentation
set shiftwidth=4

"Show the line and column number of the cursor position, separated by a comma
set ruler
 
"Make Vim use 256 colors
set t_Co=256

"Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j 
endif

"Tells Vim what the background color looks like
set background=light

"Set a color scheme
colorscheme solarized 

"---MAPPINGS-------------------------------------------------------------------

"mapping <LEADER> from '\' to
let mapleader = ","

"make easy as possible to open vimrc file
nmap <leader>v :vsplit $MYVIMRC<CR>

"next buffer
nmap <leader>z :bn<CR>

"previous buffer
nmap <leader>< :bprev<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

"switch between light and dark background modes
"(provided by altercation/vim-colors-solarized)
call togglebg#map("<F5>")

"toggle the indent lines (provided by Yggdroot/indentLine)
nmap <leader>i :IndentLinesToggle<CR>

"index of the buffer. Up to 9 mappings will be exposed
"(provided by bling/vim-airline)
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"disable arrow keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"disable arrow keys in visual mode
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

"---PLUGINS CONFIGURATION------------------------------------------------------

"---bling/vim-airline---
"Hide the default mode text (e.g. -- INSERT -- below statusline) (required)
set noshowmode

"use powerline fonts (meslo in my case)
let g:airline_powerline_fonts = 1

"show buffers tabs
let g:airline#extensions#tabline#enabled = 1

"enable/disable displaying index of the buffer. Up to 9 mappings will be exposed
let g:airline#extensions#tabline#buffer_idx_mode = 1

"configure whether buffer numbers should be shown
let g:airline#extensions#tabline#buffer_nr_show = 1

"configure how buffer numbers should be formatted with |printf|. >
let g:airline#extensions#tabline#buffer_nr_format = '%s '

"color theme
let g:airline_theme = 'light'

"---kshenoy/vim-signature---

"Asks for confirmation before deleting all marks/markers
let g:SignaturePurgeConfirmation = 1

"---Yggdroot/indentLine---

"Specify whether to enable indentLine plugin by default
let g:indentLine_enabled = 0

"Specify the character to be used as indent line in unix systems
if has("unix")
    let g:indentLine_char = '┊'
endif

"Specify terminal vim indent line color. Gray scale from 232 (black) to 255 (white)
let g:indentLine_color_term = 243

