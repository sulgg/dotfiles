no compatibility with vi
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

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'kshenoy/vim-signature'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'glts/vim-textobj-comment'
Plugin 'kien/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'

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
set t_Co=256

"Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

"Tells Vim what the background color looks like
set background=light

"Set a color scheme
"colorscheme gruvbox

"When writing a file and a backup is made,
"make a copy of the file and overwrite the original one
set backupcopy=yes

"---vim macros----------------------------------------------------------------
"% command moves between html tags
runtime macros/matchit.vim

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

"improve omni completion keys, used for tern
inoremap <leader>, <C-x><C-o>

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

"---PLUGIN KEY MAPPINGS--------------------------------------------------------

"open fugitive Git status
nmap <leader>gs :Gstatus<CR>

"save and stage file with fugitive
nmap <leader>gw :Gwrite<CR>

"commit changes with fugitive
nmap <leader>gc :Gcommit<CR>

"show vertical diff with fugitive
nmap <leader>gd :Gvdiff<CR>

"undo hunk in line with GitGutter
nmap <leader>gu :GitGutterUndoHunk<CR>

"jump to the next marked hunk.  Takes a count.
nmap <leader>gn :GitGutterNextHunk<CR>

"toggle the indent lines (provided by Yggdroot/indentLine)
nmap <leader>i :IndentLinesToggle<CR>

"open/close buffergator catalog (jeetsukumaran/vim-buffergator)
if !exists('g:buffergator_suppress_keymaps') || !g:buffergator_suppress_keymaps
    nnoremap <silent> <Leader>b :BuffergatorToggle<CR>
endif

"---PLUGINS CONFIGURATION------------------------------------------------------

"---bling/vim-airline---

"Hide the default mode text (e.g. -- INSERT -- below statusline) (required)
set noshowmode

"enable/disable fugitive/lawrencium integration
"show or not branch name in section b
let g:airline#extensions#branch#enabled = 1

"enable/disable syntastic integration
let g:airline#extensions#syntastic#enabled = 1

"define the dictionary of unicode symbols first before setting values
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

"---jeetsukumaran/vim-buffergator---

"if true, will not automatically map <Leader>b to open Buffergator
"it must be true in order to remap <leader>b to BuffergatorToggle
"this line must be after the remap of <leader>b
let g:buffergator_suppress_keymaps = 1

"Determines how a new Buffergator window will be opened.
" 'T' horizontal top (full screen width)
let g:buffergator_viewport_split_policy = 'T'

"height of the Buffergator window in any horizontal splitting mode
let g:buffergator_hsplit_size = 10

"---kshenoy/vim-signature---

"Asks for confirmation before deleting all marks/markers
let g:SignaturePurgeConfirmation = 1

"---Yggdroot/indentLine---

"Specify whether to enable indentLine plugin by default
let g:indentLine_enabled = 0

"--Raimondi/delimitMate--
"Turns on/off the expansion of <CR>
let delimitMate_expand_cr = 1

