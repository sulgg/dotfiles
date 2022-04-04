-- Most of the config is in tpope/vim-sensible
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

-- ########################################################

--colors
vim.opt.termguicolors = true
vim.opt.background = 'light'

require('ayu').colorscheme()
require('ayu').setup({
    -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
    mirage = false, 
    -- A dictionary with a group names associated with a dictionary with parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
    overrides = {}, 
})

require("bufferline").setup {
	options = {
		numbers = "buffer_id",
	}
}

require('gitsigns').setup{
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
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
