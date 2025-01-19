local v = vim

local map = v.keymap.set

-- stylua: ignore start
--- custom keymaps
map('n', '<C-c>', 'ciw', { desc = 'Change inner word keybind' })
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Start of the line' })
map({ 'n', 'v', 'o' }, 'L', 'g_', { desc = 'End of the line' })

-- align manually
map('v', '<', '<gv', { desc = 'Better align items' })
map('v', '>', '>gv', { desc = 'Better align items' })

-- resise splits
map('n', '<M-l>', '<cmd>vertical resize +20<CR>', { desc = 'Increase split right' })
map('n', '<M-h>', '<cmd>vertical resize -20<CR>', { desc = 'Decrease split left' })
map('n', '<M-j>', '<cmd>horizontal resize -20<CR>', { desc = 'Decrease split down' })
map('n', '<M-j>', '<cmd>horizontal resize +20<CR>', { desc = 'Decrease split up' })

-- custom rename
map('n', '<leader>cr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- signature help
map({ 'i', 'n' }, '<c-s>', function() v.lsp.buf.signature_help() end, { desc = 'Toggle signature help' })

-- quick fix list
map('n', '<leader>q', ':cope<CR>', { desc = 'Toggle quickfix list' })
map('n', ']q', ':cnext<CR>', { desc = 'Next quickfix item' })
map('n', '[q', ':cprev<CR>', { desc = 'Previous quickfix item' })

map('n', '<leader>D', function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	local is_enabled = vim.diagnostic.is_enabled()
	local msg = is_enabled and 'enabled' or 'disabled'
	v.notify(string.format('Diagnostic has been %s', msg), vim.log.levels.INFO)
end)

map('n', '<leader>S', function()
	vim.cmd([[set spell!]])
	local is_spell_on = vim.opt.spell:get() and 'on' or 'off'
	vim.notify(string.format('spell is %s', is_spell_on), vim.log.levels.INFO)
end, { desc = 'Manage spell' })

-- make executable current buffer
map('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- source current buffer
map('n', '<leader><leader>', function() vim.cmd('so') end)

-- remove suspend keybind
map('n', '<C-z>', '<Nop>', { noremap = true, silent = true })

-- toggle cmp
map('n', '<leader>C', '<cmd>ToggleCmp<CR>', { noremap = true, silent = true })
