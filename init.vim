"Plugin manager by junegunn/vim-plug ---------------------------------- plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible' "<-NEVER DELETE. It is the basic conf set
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesToggle'}
"Others
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
call plug#end()

"Most of the config is in tpope/vim-sensible --------------------------- config
set termguicolors "true color terminal
set expandtab "insert space(s) whenever <tab> key is pressed
set tabstop=4 "number of spaces <tab> counts for
set softtabstop=4 "number of columns <tab> counts for in insert mode
set shiftwidth=4 "number of spaces inserted for indentation
set number "show line numbers
set hidden "hide buffers when they are abandoned
set showcmd "show (partial) command in the last line of the screen
set textwidth=79 "after this limit line will broke
set smartcase "do smart case matching
set ignorecase "select case-sensitiv search
set backupcopy=yes "when writing a file and a backup is made,
set foldmethod=marker "visible text markers rather than invisible
set statusline=[%n]%{Cabeza()}%t\ %m\ %r%=%l:%c "petit statusline
let g:netrw_banner = 0 "remove netrw top banner
let g:netrw_liststyle = 3 "netrw tree style listing
let g:indentLine_enabled = 0 "[Yggdroot/indentLine] off by default
let ayucolor="light" "[ayu-theme/ayu-vim] any of light, dark or mirage
colorscheme ayu "colorscheme. termguicolors must be set beforehand
highlight Comment cterm=italic gui=italic "must be set after colorscheme

"[tpope/vim-fugitive] if detached shows hash (7 chars), else, branch name
function! Cabeza()
    if (exists('*FugitiveHead') && !(FugitiveHead(7) == ''))
        return ' ['.FugitiveHead(7).'] '
    endif
    return ' '
endfunction

"Always use [x]noremap as Steve Losh says ---------------------------- mappings
"mapping <LEADER> from '\' to ','
let mapleader = ","
"make easy as possible to open vimrc file
nnoremap <leader>rc :e $MYVIMRC<CR>
"insert a semicolon at the end of line from normal mode
nnoremap <leader>; A;<C-[>
"Q do nothing to avoid entering Ex mode by accident
nnoremap Q <nop>
"insert [count] blank lines in normal mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
"switch from Terminal mode back to Normal mode but still capable
"to send an Escape key to the terminal by pressing <C-v><Esc>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
"[airblade/vim-gitgutter] undo hunk in line
nnoremap <leader>u :GitGutterUndoHunk<CR>
"[airblade/vim-gitgutter] jump to the next marked hunk
nnoremap <leader>n :GitGutterNextHunk<CR>zz
"[Yggdroot/indentLine] toggle the indent lines
nnoremap <leader>i :IndentLinesToggle<CR>
"[rust-lang/rust.vim] write, format, cargo check and get into Terminal mode
nnoremap <leader>. :w<bar>RustFmt<bar>Ccheck<CR>i
"[rust-lang/rust.vim] write, format, cargo run and get into Terminal mode
nnoremap <leader>m :w<bar>RustFmt<bar>Crun<CR>i
