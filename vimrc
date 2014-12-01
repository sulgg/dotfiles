"no compatibility with vi
set nocompatible

"disable file type detection but keep the flags for 'plugin' and 'indent' unchanged
filetype off

"enable syntax highlighting
syntax on

"Highlight the line containing the cursor
set number

"Highlight line at cursor
set cursorline

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
 
"Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j 
endif

"Keep folds when file closes
if has("autocmd")
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview
endif

"---MAPPINGS-------------------------------------------------------------------

"mapping <LEADER> from '\' to
let mapleader = ","

"make easy as possible to open vimrc file
nmap <leader>v :vsplit $MYVIMRC<CR>

"next buffer
nmap <leader>z :bn<CR>

"previous buffer
nmap <leader>< :bprev<CR>

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

