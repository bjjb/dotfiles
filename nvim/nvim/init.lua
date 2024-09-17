-- General options
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

-- Keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Sparkles
vim.cmd.colorscheme('habamax')
vim.cmd.hi('Comment gui=none')

-- Highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.highlight.on_yank() end,
})

-- Globals for use by plugins
vim.g.have_nerd_font = true

-- Packages
local packadd = require("packadd")
packadd('tpope/vim-abolish')
packadd('tpope/vim-apathy')
packadd('tpope/vim-commentary')
packadd('tpope/vim-dadbod')
packadd('tpope/vim-dispatch')
packadd('tpope/vim-endwise')
packadd('tpope/vim-eunuch')
packadd('tpope/vim-fugitive')
packadd('tpope/vim-projectionist')
packadd('tpope/vim-repeat')
packadd('tpope/vim-surround')
packadd('tpope/vim-unimpaired')
packadd('editorconfig/editorconfig-vim')
packadd('neovim/nvim-lspconfig')

require'lspconfig'.pyright.setup{}
