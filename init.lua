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
vim.opt.backupcopy = 'yes'
--visible text markers rather than invisible
vim.opt.foldmethod = 'marker'
--big font size in gui
-- vim.opt.guifont = 'monospace:h20'
vim.opt.guifont = 'MesloLGM Nerd Font:h20'

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
map('n', 'Q', '<nop>')
-- insert a semicolon at the end of line
map('n', '<leader>;', 'A;<esc>')
-- insert [count] blank lines
map('n', '<leader>o', 'o<esc>')
map('n', '<leader>O', 'O<esc>')
-- [lukas-reineke/indent-blankline.nvim] toggle indentLine
map('n', '<leader>i', ':IndentBlanklineToggle<cr>')
-- [BuferLine] easy selection of a buffer in view
map('n', 'gb', ':BufferLinePick<CR>', {silent = true})

-- ########################################################

--colors
vim.opt.termguicolors = true
vim.opt.background = 'light'

require('ayu').colorscheme()
require('ayu').setup({})

require('gitsigns').setup()

local function mifunc()
	return os.getenv("CONDA_DEFAULT_ENV")
end
require('lualine').setup {
  sections = {
    lualine_x = {{ mifunc }, 'encoding', 'fileformat', 'filetype'},
  },
  extensions = {'fugitive'},
}

require("bufferline").setup()

-- ########## firenvim ###################################

local whitelistedSites = {"http://localhost:8888/*"}
local localSettings = {
    [".*"] = {
        cmdline = "nvim",
        takeover = "never"
    }
}
for _, site in pairs(whitelistedSites) do
    localSettings[site] = { takeover = "always" }
end

vim.g.firenvim_config = {
    localSettings = localSettings
}

require'nvim-treesitter.configs'.setup {
    --deben instalarse via TSInstall
    ensure_installed = {
        "css",
        "html",
        "javascript",
        "lua",
        "python",
        "svelte",
        "typescript",
        "yaml",
        "vim"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        use_languagetree = true,
    },
}

require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt" , "vim" },
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})
local ts_conds = require('nvim-autopairs.ts-conds')

require("indent_blankline").setup {
    enabled = 'off',
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
}
