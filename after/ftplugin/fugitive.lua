local map = vim.keymap.set

local bryant_fugitive = vim.api.nvim_create_augroup('bryant_fugitive', {})

local autocmd = vim.api.nvim_create_autocmd
autocmd('BufWinEnter', {
	group = bryant_fugitive,
	pattern = '*',
	callback = function()
		if vim.bo.ft ~= 'fugitive' then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }

		-- stylua: ignore start
		map('n', '<c-p>', function()
			vim.cmd.Git('push')
		end, opts)

		map(
			'n',
			'<leader>gd',
			'<cmd>Gvdiffsplit!<CR>',
			{ desc = 'Git diff split with fugitive' }
		)

		-- rebase always
		map('n', '<leader>P', function()
			vim.cmd.Git({ 'pull', '--rebase' })
		end, opts)

		-- NOTE: It allows me to easily set the branch i am pushing and any tracking
		-- needed if i did not set the branch up correctly
		map('n', '<leader>p', ':Git push -u origin ', opts)
	end,
})

map('n', 'gu', '<cmd>diffget //2<CR>', { desc = 'Get ours changes' })
map('n', 'gh', '<cmd>diffget //3<CR>', { desc = 'Get theirs changes' })
