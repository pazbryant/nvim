local map = vim.keymap.set

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'Clear highlights' })

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
map('n', '<leader>sp', '<cmd>set spell!<CR>', { desc = 'Toggle spelling check' })

-- custom rename
map('n', '<leader>cr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- signature help
map({ 'i', 'n' }, '<C-k>', function()
	vim.lsp.buf.signature_help()
end, { desc = 'Toggle signature help' })
