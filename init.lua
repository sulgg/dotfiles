-- De vez en cuando dar formato con StyLua asi:
-- brew install stylua (si es que no esta instalado)
-- stylua init.lua

--lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--show conda env in lualine
local function mifunc()
	return os.getenv("CONDA_DEFAULT_ENV")
end

-- lazy.nvim conf
require("lazy").setup({
	"tpope/vim-sensible",
	"tpope/vim-fugitive",
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"python",
					"markdown",
					"css",
					"html",
					"javascript",
					"lua",
					"typescript",
					"yaml",
					"vim",
				},
				sync_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					use_languagetree = true,
				},
				indent = { enable = true },
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = {
			enabled = "off",
			use_treesitter = true,
			show_current_context = true,
			show_current_context_start = true,
		},
	},
	{
		"Shatur/neovim-ayu",
		config = function()
			local configs = require("ayu")
			configs.colorscheme()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = {
			sections = {
				lualine_x = { { mifunc }, "encoding", "fileformat", "filetype" },
			},
			extensions = { "fugitive" },
			options = {
				theme = "ayu",
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	"lewis6991/gitsigns.nvim",
})

--colors
vim.opt.termguicolors = true
vim.opt.background = "light"

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
	local options = { noremap = true }
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
map("n", "<leader>i", ":IndentBlanklineToggle<cr>")
-- [BuferLine] easy selection of a buffer in view
map("n", "gb", ":BufferLinePick<CR>", { silent = true })

-- ########################################################

--nvim-autopairs: You can use treesitter to check for a pair.
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
npairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- it will not add a pair on that treesitter node
		javascript = { "template_string" },
		java = false, -- don't check treesitter on java
	},
})
local ts_conds = require("nvim-autopairs.ts-conds")
