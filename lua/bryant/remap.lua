local map = vim.keymap.set

map('n', '<C-c>', 'ciw', { desc = 'Change inner word' })

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'Clear highlights' })

map('n', '<C-c>', 'ciw', { desc = 'Change inner word' })

-- move items in visual mode
map('n', 'J', 'mzJ`z', { desc = 'One row align items' })

-- center scren when navigate with nvim default key binds
map('n', '<C-d>', '<C-d>zz', { desc = 'Better c-d command' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Better c-u command' })
map('n', '{', '{zz', { desc = 'Better go to the next block command' })
map('n', '}', '}zz', { desc = 'Better go to the previous block command' })
map('n', '<C-o>', '<C-o>zz', { desc = 'Better go to the previous location' })
map('n', '<C-i>', '<C-i>zz', { desc = 'Better go to the next location' })

-- improve register key binds
map('x', '<leader>p', [["_dP]], { desc = 'Paste without override register' })
map(
	{ 'n', 'v' },
	'<leader>d',
	[["_d]],
	{ desc = 'Delete without override register' }
)

-- replace text
map(
	'n',
	'<leader>s',
	[[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]],
	{ desc = 'Replace word' }
)

-- align manually
map('v', '<', '<gv', { desc = 'Better align items' })
map('v', '>', '>gv', { desc = 'Better align items' })

-- use Telescope for spell suggest
map('n', 'z=', '<cmd>Telescope spell_suggest<CR>', { desc = 'Suggest spell' })
