"Index
"global_config
"plugins_config
"key_mappings
"plugins_key_mappins

"Plugins provided by junegunn/vim-plug 
"Check options for on-demand loading in:
" https://github.com/junegunn/vim-plug#on-demand-loading-of-plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible' "<-set de configuracion basico<==OJO
Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesToggle'}
"Otros Plugins
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
call plug#end()

"no compatibility with vi
set nocompatible

"Global Config --------------------------------- global_config

"true color terminal required
set termguicolors

"no show status mode. It must be in the status bar (powerline likes)
set noshowmode

"Show line numbers
set number

"italics in comments. This line must go after setting the colorscheme
highlight Comment cterm=italic gui=italic

"Hide buffers when they are abandoned
set hidden

"Show (partial) command in status line
set showcmd

"A longer line will be broken after white space to get this width
set textwidth=79

"Do smart case matching
set smartcase

"Select case-sensitiv search
set ignorecase

set expandtab "Insert space characters whenever the tab key is pressed
set tabstop=4 "Number of space characters inserted when the tab key is pressed
set softtabstop=4 "Number of spaces that a <Tab> counts for while editing operations
set shiftwidth=4 "Change the number of space characters inserted for indentation

"When writing a file and a backup is made,
"make a copy of the file and overwrite the original one
set backupcopy=yes

"folds are set by visible text markers rather than invisible manual marks
set foldmethod=marker

"Plugins Config --------------------------------- plugins_config

"rust-lang/rust.vim
"run cargo commands with ! instead of :terminal
":terminal opens a new splitted windows
let g:cargo_shell_command_runner = '!'

"ayu-theme/ayu-vim
"Ayu Set a color scheme
let ayucolor="light"
colorscheme ayu

"Yggdroot/indentLine
"off by default. Open with <leader>i to open
let g:indentLine_enabled = 0

"Key Mappings ----------------------------------- key_mappings

"mapping <LEADER> from '\' to
let mapleader = ","

"make easy as possible to open vimrc file
nmap <leader>rc :e $MYVIMRC<CR>

"insert a semicolon at the end of line from normal mode
nmap <leader>; A;<C-[>

"insert a colon at the end of line from normal mode
nmap <leader>, A,<C-[>

"execute shell git log command
"works only when file is inside project directory
nmap <leader>gl :!git log --oneline --graph --all --max-count=20<CR>

"let C-p and C-n filter command history
cnoremap <C-p> <up>
cnoremap <C-n> <down>

"Q do nothing to avoid entering Ex mode by accident
nnoremap Q <nop>

"Plugins Key Mappings --------------------------- plugins_key_mappins

"open Git status (tpope/vim-sensible)
nmap <leader>gs :Gstatus<CR>

"show vertical diff (tpope/vim-sensible)
nmap <leader>gd :Gvdiff<CR>

"undo hunk in line (airblade/vim-gitgutter)
nmap <leader>gu :GitGutterUndoHunk<CR>

"jump to the next marked hunk (airblade/vim-gitgutter)
nmap <leader>gn :GitGutterNextHunk<CR>

"toggle the indent lines (Yggdroot/indentLine)
nmap <leader>i :IndentLinesToggle<CR>

"toggle NERDTree panel (scrooloose/nerdtree)
nmap <leader>n :NERDTreeToggle<CR>

"write file and cargo check (rust-lang/rust.vim)
nmap <leader>. :w<bar>Ccheck<CR>

"cargo run (rust-lang/rust.vim)
nmap <leader>m :w<bar>Crun<CR>

