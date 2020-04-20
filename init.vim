"Index ------------------------------------------------------------------ index
"mis_plugins
"mi_config
"key_mappings
"plugins_key_mappins

"Mis Plugins ------------------------------------------------------ mis_plugins
"Plugins provided by junegunn/vim-plug 
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible' "<-NEVER DELETE. It is the basic conf set
Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
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

"Mi Config ---------------------------------------------------------- mi_config
"Most of the config is in tpope/vim-sensible
set expandtab "insert space whenever the <Tab> key is pressed
set tabstop=4 "spaces inserted when <Tab> key is pressed
set softtabstop=4 "spaces <Tab> counts for while editing operations
set shiftwidth=4 "spaces inserted for indentation
set termguicolors "true color terminal required
set noshowmode "no show status mode. required by powerline likes
set number "show line numbers
set hidden "hide buffers when they are abandoned
set showcmd "show (partial) command in status line
set textwidth=79 "after this limit line will broke
set smartcase "do smart case matching
set ignorecase "select case-sensitiv search
set backupcopy=yes "when writing a file and a backup is made,
set foldmethod=marker "visible text markers rather than invisible

"itchyny/lightline.vim
let g:lightline = {
\    'colorscheme': 'ayu_mirage',
\    'active': {
\        'left': [['mode', 'paste'],
\                ['numerobuffer', 'estadofugitivo',
\                  'readonly', 'filename', 'modified']],
\        'right': [[],
\                 ['lineinfo'],
\                 []]
\    },
\    'inactive': {
\        'left': [['numerobuffer', 'filename']],
\        'right': [[],
\                 []]
\    },
\    'component': {
\        'numerobuffer': '%n',
\    },
\    'component_function': {
\        'estadofugitivo': 'EstadoFugitivo',
\    },
\}

"tpope/vim-fugitive - itchyny/lightline.vim
"Si esta detached muestra el hash (7 chars), sino el nombre del branch
function! EstadoFugitivo()
    if exists('*FugitiveHead')
        return FugitiveHead(7)
    endif
    return ''
endfunction

"rust-lang/rust.vim
"run cargo commands with ! instead of :terminal
"(:terminal opens a new fixed windows)
let g:cargo_shell_command_runner = '!'

"ayu-theme/ayu-vim
"could be light or dark
let ayucolor="light"

"colorscheme. termguicolors must be set beforehand
colorscheme ayu
"italics in comments. must be set after colorscheme
highlight Comment cterm=italic gui=italic

"Yggdroot/indentLine
"off by default. Open with <leader>i to open
let g:indentLine_enabled = 0

"Key Mappings ----------------------------------- key_mappings
"remember to always use nnoremap as this guy says:
"https://learnvimscriptthehardway.stevelosh.com/chapters/05.html

"mapping <LEADER> from '\' to
let mapleader = ","

"make easy as possible to open vimrc file
nnoremap <leader>rc :e $MYVIMRC<CR>

"insert a semicolon at the end of line from normal mode
nnoremap <leader>; A;<C-[>

"let C-p and C-n filter command history
cnoremap <C-p> <up>
cnoremap <C-n> <down>

"Q do nothing to avoid entering Ex mode by accident
nnoremap Q <nop>

"insert [count] blank lines in normal mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

"Plugins Key Mappings --------------------------- plugins_key_mappins

"open git log in quickfix window (tpope/vim-sensible)
nnoremap <leader>gl :Gclog!<CR>

"undo hunk in line (airblade/vim-gitgutter)
nnoremap <leader>gu :GitGutterUndoHunk<CR>

"jump to the next marked hunk (airblade/vim-gitgutter)
nnoremap <leader>gn :GitGutterNextHunk<CR>zz

"toggle the indent lines (Yggdroot/indentLine)
nnoremap <leader>i :IndentLinesToggle<CR>

"toggle NERDTree panel (scrooloose/nerdtree)
nnoremap <leader>n :NERDTreeToggle<CR>

"write file and cargo check (rust-lang/rust.vim)
nnoremap <leader>. :w<bar>Ccheck<CR>

"cargo run (rust-lang/rust.vim)
nnoremap <leader>m :w<bar>Crun<CR>

