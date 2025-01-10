local v = vim
--- home rome
local map = v.keymap.set

--- custom keymaps
map('n', '<C-c>', 'ciw', { desc = 'Change inner word keybind' })
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Start of the line' })
map({ 'n', 'v', 'o' }, 'L', 'g_', { desc = 'End of the line' })

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

-- toggle spell
map('n', '<leader>sp', function()
	vim.cmd([[set spell!]])
	local is_spell_on = vim.opt.spell:get()
	vim.notify('Spell ' .. (is_spell_on and 'ON' or 'OFF'), 'info')
end, { desc = 'Toggle spelling check' })

-- custom rename
map('n', '<leader>cr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- signature help
map({ 'i', 'n' }, '<C-s>', function()
	v.lsp.buf.signature_help()
end, { desc = 'Toggle signature help' })

-- Quick fix list
map('n', '<leader>q', ':cope<CR>', { desc = 'Toggle quickfix list' })
map('n', '<leader>cn', ':cnext<CR>', { desc = 'Next quickfix item' })
map('n', '<leader>cp', ':cprev<CR>', { desc = 'Previous quickfix item' })

map('n', '<leader>dd', function()
	local is_enabled = vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	local msg = is_enabled and 'enabled' or 'disabled'
	v.notify(string.format('Diagnostic has been %s', msg), 'info')
end)

-- Remove suspend keybind
map('n', '<C-z>', '<Nop>', { noremap = true, silent = true })
