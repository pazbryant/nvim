local v = vim

local map = v.keymap.set

-- stylua: ignore start
--- custom keymaps
map('n', '<C-c>', 'ciw', { desc = 'Change inner word keybind' })
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Start of the line' })
map({ 'n', 'v', 'o' }, 'L', 'g_', { desc = 'End of the line' })

-- copy into system clipboard
map({'n', 'v'}, '<leader>y', '"+y') -- yank motion
map({'n', 'v'}, '<leader>Y', '"+Y') -- yank line

-- Delete into system clipboard
map({'n', 'v'}, '<leader>d', '"+d') -- delete motion
map({'n', 'v'}, '<leader>D', '"+D') -- delete line

-- Paste from system clipboard
map({'n','v'}, '<leader>p', '"+p')  -- paste after cursor
map({'n','v'}, '<leader>P', '"+P')  -- paste before cursor

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

-- make executable current buffer
map('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- source current buffer
map('n', '<leader><leader>', function() vim.cmd('so') end)

-- remove suspend keybind
map('n', '<C-z>', '<Nop>', { noremap = true, silent = true })

-- toggle cmp
map('n', '<leader>C', '<cmd>CmpToggle<CR>', { noremap = true, silent = true })

map('n', '<leader>S', '<cmd>SpellToggle<CR>', { noremap = true, silent = true })
