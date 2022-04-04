"Plugin manager by junegunn/vim-plug ---------------------------------- plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible' "<-NEVER DELETE. It is the basic conf set
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
"Others
Plug 'rust-lang/rust.vim', {'for': 'rust'}
"lua
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'akinsho/bufferline.nvim'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

lua require('init')
