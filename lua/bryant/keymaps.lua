local v = vim

local map = v.keymap.set

-- stylua: ignore start
-- custom keymaps
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Start of the line' })
map({ 'n', 'v', 'o' }, 'L', 'g_', { desc = 'End of the line' })

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

-- custom rename
map('n', '<leader>cr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- signature help
map({ 'i', 'n' }, '<c-s>', function() v.lsp.buf.signature_help() end, { desc = 'Toggle signature help' })

-- print current path
map('n', '<leader>cp',"<cmd>echo expand('%:p')<cr>",{ desc = "Print current path" })

-- remove suspend keybind
map('n', '<C-z>', '<Nop>', { desc = "Disable neovim suspend" })

-- quickfix list
map('n', '<C-q>', function()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd('cclose')
      return
    end
  end
  vim.cmd('copen')
end, { desc = 'Toggle Quickfix List' })

map('n', ']q', '<cmd>cnext<CR>', { desc = 'Next quickfix item' })
map('n', '[q', '<cmd>cprev<CR>', { desc = 'Previous quickfix item' })
