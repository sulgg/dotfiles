"Plugin manager by junegunn/vim-plug ---------------------------------- plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible' "<-NEVER DELETE. It is the basic conf set
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesToggle'}
"Colors
Plug 'ayu-theme/ayu-vim'
"Others
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
call plug#end()

"Most of the config is in tpope/vim-sensible --------------------------- config
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
set backupcopy=yes "symbolic links are preserved
set foldmethod=marker "visible text markers rather than invisible
set statusline=[%n]\ [%{FugitiveHead(7)}]\ %t\ %m\ %r%=%l:%c "petit statusline
let g:netrw_banner = 0 "remove netrw top banner

"Colors. Highlight groups must be set after colorscheme ---------------- colors
set termguicolors "true color terminal
set background=light
let ayucolor="light" "[ayu-theme/ayu-vim] any of light, dark or mirage
silent! colorscheme ayu "colorscheme. termguicolors must be set beforehand
highlight Comment cterm=italic gui=italic
highlight Error ctermfg=White ctermbg=Red guifg=White guibg=Red
highlight ErrorMsg ctermfg=White ctermbg=Red guifg=White guibg=Red
highlight Search ctermfg=Black ctermbg=Yellow guifg=Black guibg=Yellow
highlight IncSearch ctermfg=Red ctermbg=White  guifg=Red guibg=White

"highlight yank selection using 'Search' higroup
au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Search", timeout=700}

"Always use [x]noremap as Steve Losh says ---------------------------- mappings
"insert corresponding closing character
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>
inoremap ' ''<left>
inoremap " ""<left>
inoremap <bar> <bar><bar><left>
"Q do nothing to avoid entering Ex mode by accident
nnoremap Q <nop>
"let C-p and C-n filter command history
cnoremap <C-p> <up>
cnoremap <C-n> <down>
"switch from Terminal mode back to Normal mode but still capable
"to send an Escape key to the terminal by pressing <C-v><Esc>
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><esc> <esc>
endif
"insert a semicolon at the end of line
nnoremap <leader>; A;<esc>
"insert [count] blank lines
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
"[Yggdroot/indentLine] toggle indentLine
nnoremap <leader>i :IndentLinesToggle<cr>
"[rust-lang/rust.vim] format, write, cargo run, insert
nnoremap <leader>r :RustFmt<bar>wa<bar>Crun<cr>i
"[rust-lang/rust.vim] format, write, cargo check, insert
nnoremap <leader>c :RustFmt<bar>wa<bar>Ccheck<cr>i
"[rust-lang/rust.vim] format, write, test under the cursor, insert
nnoremap <leader>t :RustFmt<bar>wa<bar>RustTest -- --show-output<cr>
"[rust-lang/rust.vim] format, write, run full tests, insert
nnoremap <leader>f :RustFmt<bar>wa<bar>Ctest<cr>i
"[rust-lang/rust.vim] format, write, run cargo bench, insert
nnoremap <leader>b :RustFmt<bar>wa<bar>Cbench<cr>i
