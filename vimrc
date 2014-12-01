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
