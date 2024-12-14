local api = vim.api
local autocmd = api.nvim_create_autocmd

local bryant_group = api.nvim_create_augroup('bryant_group', { clear = true })

--- smart number from https://github.com/jeffkreeftmeijer/vim-numbertoggle
autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
	desc = 'Toggle number mode',
	command = [[if &nu && mode() != 'i' | set rnu   | endif]],
	group = bryant_group,
})

autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
	desc = 'Toggle number mode',
	command = [[if &nu | set nornu | endif]],
	group = bryant_group,
})

autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = bryant_group,
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 300 })
	end,
})

autocmd({ 'WinEnter', 'BufEnter', 'InsertLeave' }, {
	group = bryant_group,
	pattern = '*',
	callback = function()
		if not vim.opt_local.cursorline:get() then
			vim.opt_local.cursorline = true
		end
	end,
})

autocmd({ 'WinLeave', 'BufLeave', 'InsertEnter' }, {
	group = bryant_group,
	pattern = '*',
	callback = function()
		if vim.opt_local.cursorline:get() then
			vim.opt_local.cursorline = false
		end
	end,
})

autocmd('BufReadPost', {
	desc = 'Go to last loc when opening a buffer',
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

autocmd({ 'BufNewFile', 'BufRead' }, {
	desc = 'Ignore diagnostics in some directories',
	pattern = {
		'**/node_modules/**',
		'node_modules',
		'/node_modules/*',
	},
	callback = function()
		vim.diagnostic.disable(0)
	end,
})

-- :echo &ft to know floating window
-- clear cursor when exin nvim

autocmd('FileType', {
	desc = 'Disable auto-comment',
	command = 'set formatoptions-=o',
	group = bryant_group,
})
