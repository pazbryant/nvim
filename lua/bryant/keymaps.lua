local map = vim.keymap.set

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'Clear highlights' })

-- improve register key binds
map('x', '<leader>p', [["_dP]], { desc = 'Paste without override register' })

map(
	{ 'n', 'v' },
	'<leader>d',
	[["_d]],
	{ desc = 'Delete without override register' }
)

-- align manually
map('v', '<', '<gv', { desc = 'Better align items' })
map('v', '>', '>gv', { desc = 'Better align items' })

-- split window
map('n', '<c-w>"', '<C-W>s', { desc = 'Split window below' })
map('n', '<c-w>%', '<C-W>v', { desc = 'Split window right' })

-- toggle spell
map(
	'n',
	'<leader>sp',
	'<cmd>set spell!<CR>',
	{ desc = 'Toggle spelling check' }
)

-- custom tmux script
map(
	'n',
	'<C-f>',
	'<cmd>silent !tmux neww ~/bin/tmux/new-session<CR>',
	{ desc = 'Open new session' }
)

map(
	'n',
	'<C-s>',
	'<cmd>silent !tmux neww ~/bin/tmux/select-session<CR>',
	{ desc = 'Select session' }
)
