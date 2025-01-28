local o = vim.opt_local
o.spell = true
o.spc = ''

vim.opt_local.wrap = true
vim.opt_local.textwidth = 80

vim.keymap.set(
	'n',
	'<c-t>',
	'<cmd>ObsidianSearch<cr>',
	{ desc = 'ObsidianSearch' }
)

vim.keymap.set(
	'n',
	'<m-c>',
	'<cmd>ObsidianQuickSwitch<cr>',
	{ desc = 'Obsidian Quick Switch' }
)
