local o = vim.opt_local
local v = vim
o.spell = true
o.spc = ''

local map = v.keymap.set
map('n', '<c-t>', '<cmd>ObsidianSearch<CR>', { desc = 'Search with obsidian' })
