local v = vim
--- home rome
local map = v.keymap.set

--- change inner word
map('n', '<C-c>', 'ciw', { desc = 'Change inner word keybind' })

--- Better `J` command
map('n', 'J', 'mzJ`z', { desc = 'Better `J` command' })

--- clear highlights
map('n', '<leader>nh', '', {
	callback = function()
		v.o.hlsearch = not v.o.hlsearch
	end,
	noremap = true,
	silent = true,
	desc = 'Toggle hlsearch mode.',
})

--- custom keymaps
map({ 'n', 'v' }, 'H', '^', { desc = 'Start of the line' })
map({ 'n', 'v' }, 'L', 'g_', { desc = 'End of the line' })

-- improve register key binds
map('x', '<leader>p', [["_dP]], { desc = 'Paste without override register' })

map({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without override register' })

-- align manually
map('v', '<', '<gv', { desc = 'Better align items' })
map('v', '>', '>gv', { desc = 'Better align items' })

-- split window like tmux
map('n', '<C-w>"', '<C-W>s', { desc = 'Split window below' })
map('n', '<C-w>%', '<C-W>v', { desc = 'Split window right' })

-- resise splits
map('n', '<M-l>', '<cmd>vertical resize +20<CR>', { desc = 'Increase split right' })
map('n', '<M-h>', '<cmd>vertical resize -20<CR>', { desc = 'Decrease split left' })
map('n', '<M-j>', '<cmd>horizontal resize -20<CR>', { desc = 'Decrease split down' })
map('n', '<M-j>', '<cmd>horizontal resize +20<CR>', { desc = 'Decrease split up' })

-- close splits
map('n', '<C-w>x', '<C-w>c', { noremap = true, silent = true })
map('n', '<C-w>p', '<C-w>o', { noremap = true, silent = true })

map('n', '<leader>sp', function()
	v.cmd([[set spell!]])
	v.notify('Spell has ben toggled', 'info')
end, { desc = 'Toggle spelling check' })

-- custom rename
map('n', '<leader>cr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- signature help
map({ 'i', 'n' }, '<C-k>', function()
	v.lsp.buf.signature_help()
end, { desc = 'Toggle signature help' })

-- Quick fix list
map('n', '<leader>q', ':cope<CR>', { desc = 'Toggle quickfix list' })
map('n', '<leader>cn', ':cnext<CR>', { desc = 'Next quickfix item' })
map('n', '<leader>cp', ':cprev<CR>', { desc = 'Previous quickfix item' })

-- Tmux key map custom script
map(
	'n',
	'<M-f>', -- Key combination for the mapping
	'<cmd>silent !tmux neww tmux_new_session<CR>',
	{ desc = 'Custom tmux script to create a new session' }
)
