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

-- split window like tmux
map('n', '<c-w>"', '<C-W>s', { desc = 'Split window below' })
map('n', '<c-w>%', '<C-W>v', { desc = 'Split window right' })
map('n', '<M-n>', '<C-w>w', { noremap = true, silent = true })
map('n', '<M-p>', '<C-w>W', { noremap = true, silent = true })
map('n', '<C-w>x', '<C-w>c', { noremap = true, silent = true })
map('n', '<C-w>P', '<C-w>o', { noremap = true, silent = true })

map(
	'n',
	'<C-A-h>',
	'<cmd> vertical resize -5<CR>',
	{ desc = 'Decrease split right' }
)
map(
	'n',
	'<C-A-l>',
	'<cmd> vertical resize +5<CR>',
	{ desc = 'Increase split right' }
)
map('n', '<C-A-k>', '<cmd> resize -5<CR>', { desc = 'Decrease split down' })
map('n', '<C-A-j>', '<cmd> resize +5<CR>', { desc = 'Increase split up' })

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
	'<cmd>silent !tmux neww ~/bin/tmux/new_session<CR>',
	{ desc = 'Open new session' }
)

map(
	'n',
	'<C-s>',
	'<cmd>silent !tmux neww ~/bin/tmux/select_session<CR>',
	{ desc = 'Select session' }
)

map({ 'x', 'n', 'v', 'i' }, '<C-=', '<Nop>', { desc = 'Disable keybind' })
