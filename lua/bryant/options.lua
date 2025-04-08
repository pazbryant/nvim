local v = vim
local opt = v.opt
local o = v.o
local g = v.g

g.mapleader = ' '
g.maplocalleader = ' '

opt.clipboard = 'unnamedplus'

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.showmode = true
opt.showtabline = 0
opt.guicursor = ""

opt.swapfile = false
opt.undofile = true
opt.wrap = false

o.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.cmdheight = 0

opt.nu = true
opt.rnu = true
opt.numberwidth = 1

opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true

opt.scrolloff = 5
opt.signcolumn = 'yes:1'
opt.colorcolumn = '80'
opt.isfname:append('@-@')

opt.updatetime = 50

opt.termguicolors = true

-- for obsidian
opt.conceallevel = 2

opt.spell = false
opt.spelllang = { 'en_us', 'es_mx' }

-- set spell file
opt.spellfile = '/home/bryant/.config/spell/en.utf-8.add'

-- update statusline
opt.laststatus = 0
-- opt.statusline = ' %f%m%r%h%w'

-- disable nvim startup screen
opt.shortmess:append('sI')

-- neovide
if v.g.neovide then
	v.o.guifont = 'Maple Mono NF:h9.5:w1.2:#h-none'
	v.g.neovide_refresh_rate = 60
	v.g.neovide_cursor_vfx_mode = 'railgun'
end

-- snacks aliases
_G.dd = function(...)
	Snacks.debug.inspect(...)
end
_G.bt = function()
	Snacks.debug.backtrace()
end
vim.print = _G.dd

vim.cmd.colorscheme('habamax')
