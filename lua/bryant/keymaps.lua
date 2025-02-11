local v = vim

local map = v.keymap.set

-- stylua: ignore start
-- custom keymaps
map('n', '<C-c>', 'ciw', { desc = 'Change inner word keybind' })
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Start of the line' })
map({ 'n', 'v', 'o' }, 'L', 'g_', { desc = 'End of the line' })

-- exit all
map('n', '<leader>Q', '<cmd>quitall!<cr>',  { desc = 'Exit neovim and save all' })

-- save file
map('n', '<c-m>', '<cmd>update<cr>', { desc = 'Exit neovim and save all' })

-- paste without overwrite register
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwrite register" })

-- copy without overwrite register
map({"n", "v"}, "<leader>y", [["+y]],{ desc="Copy without overwrite register" })
map("n", "<leader>Y", [["+Y]], { desc="Copy full line without overwrite register"})


-- delete without overwrite register
map({"n", "v"}, "<leader>d", "\"_d", { desc="Delete without overwrite register" })
map('n', "<leader>D", "\"_dd", { desc = "Delete full line without overwrite register" })

-- align manually
map('v', '<', '<gv', { desc = 'Better align items' })
map('v', '>', '>gv', { desc = 'Better align items' })

-- resise splits
map('n', '<M-l>', '<cmd>vertical resize +5<CR>', { desc = 'Increase split right' })
map('n', '<M-h>', '<cmd>vertical resize -5<CR>', { desc = 'Decrease split left' })
map('n', '<M-j>', '<cmd>horizontal resize -5<CR>', { desc = 'Decrease split down' })
map('n', '<M-j>', '<cmd>horizontal resize +5<CR>', { desc = 'Decrease split up' })

-- custom rename
map('n', '<leader>cr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- signature help
map({ 'i', 'n' }, '<c-s>', function() v.lsp.buf.signature_help() end, { desc = 'Toggle signature help' })

-- quick fix list
map('n', '<leader>q', ':cope<CR>', { desc = 'Toggle quickfix list' })
map('n', ']q', ':cnext<CR>', { desc = 'Next quickfix item' })
map('n', '[q', ':cprev<CR>', { desc = 'Previous quickfix item' })

-- print current path
map('n', '<leader>cp',"<cmd>echo expand('%:p')<cr>",{ desc = "Print current path" })

-- remove suspend keybind
map('n', '<C-z>', '<Nop>', { desc = "Disable neovim suspend" })

-- toggle cmp
map('n', '<leader>tc', '<cmd>CmpToggle<CR>', { desc = "Toggle cmp" })

-- toggle spell
map('n', '<leader>ts', '<cmd>SpellToggle<CR>', { desc =  "Toggle spell" })

-- toggle diagnostics
map('n','<leader>td','<cmd>DiagnosticsToggle<cr>', { desc = "Toggle diagnostics" })
