"no compatibility with vi
set nocompatible

"disable file type detection but keep the flags for 'plugin' and 'indent' unchanged
filetype off

"enable syntax highlighting
syntax on

"Show line numbers
set number

"16 millones de colores
"solo funciona en terminales que lo aceptan
set termguicolors

"Tells Vim what the background color looks like
set background=dark

"Set a color scheme
"colorscheme aqui_va_el_color_scheme..

"--PLUGINS---------------------------------------------------------------------
"probar el package manager con este pana: https://github.com/Shougo/dein.vim
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

"Treat all numerals as decimal (when using Ctrl-a or Ctrl-x)
set nrformats=

"Ex commands history limit to 200 (default is 20)
set history=200

"delay when switching insert mode to normal mode using esc key
set ttimeoutlen=10

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Make Vim use 256 colors
"set t_Co=256

"Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

"When writing a file and a backup is made,
"make a copy of the file and overwrite the original one
set backupcopy=yes

"---MAPPINGS-------------------------------------------------------------------

"mapping <LEADER> from '\' to
let mapleader = ","

"make easy as possible to open vimrc file
nmap <leader>rc :e $MYVIMRC<CR>

"toggle between the current and alternate buffer
nmap <leader>a <C-^>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

"insert a semicolon at the end of line from normal mode
nmap <leader>; A;<C-[>

"execute shell git log command
"works only when file is inside project directory
nmap <leader>gl :! clear && git log --pretty=format:'\%C(yellow)\%h\%Creset \%C(auto)\%d\%Creset \%s \%C(yellow)(\%Creset\%cr\%C(yellow))\%Creset' --graph --all --max-count=30<CR>

"let C-p and C-n filter command history
cnoremap <C-p> <up>
cnoremap <C-n> <down>

"write file, clear terminal, scalac and run Run.scala
nmap <leader>. :w <bar> !clear && scalac *scala && scala Run<CR>

"Q do nothing to avoid entering Ex mode by accident
nnoremap Q <nop>

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

