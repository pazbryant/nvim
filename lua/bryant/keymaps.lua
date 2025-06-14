local v = vim

local map = v.keymap.set

-- stylua: ignore start
-- custom keymaps

-- better change inner word
map('n', '<C-c>', 'ciw', { desc = 'Better Change Inner Word' })

--  No highlights
map('n', '<Escape>', '<cmd>noh<CR>', { desc = 'No search highlights' })

-- better quit
map('n', '<leader>q', '<cmd>quit!<cr>', { desc = 'Better quit' })

-- movement left and right
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Go To The Start Of The Line' })
map({ 'n', 'v', 'o' }, 'L', 'g_', { desc = 'Go To The End Of The Line' })

-- paste without overwrite register
map("x", "<leader>p", [["_dP]], { desc = "Paste Without Overwrite Register " })

-- copy without overwrite register
map({"n", "v"}, "<leader>y", [["+y]],{ desc="Copy Without Overwrite Register" })
map("n", "<leader>Y", [["+Y]], { desc="Copy Full Line Without Overwrite Register"})

-- delete without overwrite register
map({"n", "v"}, "<leader>d", "\"_d", { desc="Delete Without Overwrite Register" })
map('n', "<leader>D", "\"_dd", { desc = "Delete Full Line Without Overwrite Register" })

-- align manually
map('v', '<', '<gv', { desc = 'Align Items To The Left' })
map('v', '>', '>gv', { desc = 'Align Items To The Right' })

-- custom rename
map('n', '<leader>cr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Custom Rename"})

-- signature help
map({ 'i', 'n' }, '<c-s>', function() v.lsp.buf.signature_help() end, { desc = 'Toggle Signature Help' })

-- print current path
map('n', '<leader>cp', "<cmd>lua vim.notify(vim.fn.expand('%:p'))<cr>", { desc = "Print Current Path" })

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
