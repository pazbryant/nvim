local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = ' '
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.clipboard = 'unnamedplus'

opt.showmode = true
opt.showtabline = 0

opt.swapfile = false
opt.undofile = true
opt.wrap = false

o.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.cmdheight = 0

opt.nu = true
opt.relativenumber = false

opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.colorcolumn = '80'
opt.isfname:append('@-@')

opt.updatetime = 50

opt.termguicolors = true

-- for obsidian
opt.conceallevel = 2

opt.spell = false
opt.spelllang = { 'en_us', 'es_mx' }

-- set spell file
opt.spellfile = '/home/bryant/spell/en.utf-8.add'

-- disable nvim startup screen
opt.shortmess:append('sI')

if vim.g.started_by_firenvim == true then
	vim.o.laststatus = 0
else
	vim.o.laststatus = 2
end
