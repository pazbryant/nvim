local map = vim.keymap.set

if vim.bo.ft ~= 'fugitive' then
	return
end

local bufnr = vim.api.nvim_get_current_buf()
local opts = { buffer = bufnr, remap = false }

    -- stylua: ignore start
map('n', 'gp', function() vim.cmd.Git('push') end, opts)
map('n', '<leader>p', ':Git push -u origin ', opts)
map('n', '<leader>P', function() vim.cmd.Git({ 'pull', '--rebase' }) end, opts)
