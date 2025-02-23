-- from time to time format this file with stylua:
-- brew install stylua (si es que no esta instalado)
-- stylua init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo(
            {
                {"Failed to clone lazy.nvim:\n", "ErrorMsg"},
                {out, "WarningMsg"},
                {"\nPress any key to exit..."}
            },
            true,
            {}
        )
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

--show conda env in lualine
local function mifunc()
    return os.getenv("CONDA_DEFAULT_ENV")
end

-- lazy.nvim conf
require("lazy").setup(
    {
        spec = {
            "lewis6991/gitsigns.nvim",
            {
                'echasnovski/mini.nvim',
                version = '*'
            },
            {
                "nvim-tree/nvim-web-devicons",
                opts = {}
            },
            {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate"
            },
            {
                "kylechui/nvim-surround",
                version = "*", -- Use for stability; omit to use `main` branch for the latest features
                event = "VeryLazy",
                config = function()
                    require("nvim-surround").setup({})
                end
            },
            {
                'numToStr/Comment.nvim',
                opts = {}
            },
            {
                "lukas-reineke/indent-blankline.nvim",
                main = "ibl",
                opts = {
                    enabled = false
                }
            },
            {
                "windwp/nvim-autopairs",
                event = "InsertEnter",
                opts = {}
            },
            {
                "catppuccin/nvim",
                name = "catppuccin",
                priority = 1000
            },
            {
                "nvim-lualine/lualine.nvim",
                opts = {
                    theme = "catppuccin",
                    requires = {"nvim-tree/nvim-web-devicons", opt = true},
                    sections = {
                        lualine_x = {{mifunc}, "encoding", "fileformat", "filetype"}
                    },
                    extensions = {"fugitive"}
                }
            }
        }
    }
)

require('gitsigns').setup()
require('Comment').setup()

--colors
vim.opt.termguicolors = true
vim.opt.background = "light"
vim.cmd.colorscheme "catppuccin"

--insert space(s) whenever <tab> key is pressed
vim.opt.expandtab = true
--number of spaces <tab> counts for
vim.opt.tabstop = 4
--number of columns <tab> counts for in insert mode
vim.opt.softtabstop = 4
--number of spaces inserted for indentation
vim.opt.shiftwidth = 4
--show line numbers
vim.opt.number = true
--hide buffers when they are abandoned
vim.opt.hidden = true
--show (partial) command in the last line of the screen
vim.opt.showcmd = true
--do smart case matching
vim.opt.smartcase = true
--select case-sensitiv search
vim.opt.ignorecase = true
--symbolic links are preserved
vim.opt.backupcopy = "yes"
--visible text markers rather than invisible
vim.opt.foldmethod = "marker"
--big font size in gui
-- vim.opt.guifont = 'monospace:h20'
-- vim.opt.guifont = 'MesloLGM Nerd Font:h20'

-- ################### Mappings ###########################
-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    -- always use noremap as Steve Losh says
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- Q do nothing in order to avoid entering Ex mode by accident
map("n", "Q", "<nop>")
-- insert a semicolon at the end of line
map("n", "<leader>;", "A;<esc>")
-- insert [count] blank lines
map("n", "<leader>o", "o<esc>")
map("n", "<leader>O", "O<esc>")
-- [lukas-reineke/indent-blankline.nvim] toggle indentLine
map("n", "<leader>i", ":IBLToggle<cr>")

-- ########################################################

--nvim-autopairs: You can use treesitter to check for a pair.
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
npairs.setup(
    {
        check_ts = true,
        ts_config = {
            lua = {"string"}, -- it will not add a pair on that treesitter node
            javascript = {"template_string"},
            java = false -- don't check treesitter on java
        }
    }
)
local ts_conds = require("nvim-autopairs.ts-conds")
