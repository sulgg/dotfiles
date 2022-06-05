" location of init.vim soft link: ~/.config/nvim
"Plugin manager by junegunn/vim-plug ---------------------------------- plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible' "<-NEVER DELETE. It is the basic conf set
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
"Others
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'rust-lang/rust.vim', {'for': 'rust'}
"lua
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'Shatur/neovim-ayu'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'akinsho/bufferline.nvim'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

" location of init.lua soft link: ~/.config/nvim/lua
lua require('init')
