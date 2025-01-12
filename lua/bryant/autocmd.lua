local api = vim.api
local map = vim.keymap.set
local autocmd = api.nvim_create_autocmd

local bryant_group = api.nvim_create_augroup('bryant_group', { clear = true })

autocmd('BufEnter', {
	desc = 'Remove Status Line Background',
	group = bryant_group,
	callback = function()
		vim.cmd([[highlight StatusLine guibg=NONE ctermbg=NONE]])
		vim.cmd([[highlight StatusLineNC guibg=NONE ctermbg=NONE]])
	end,
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
		vim.opt_local.cursorline = true
	end,
})

-- Disable cursorline when leaving a window, buffer, or entering insert mode
autocmd({ 'WinLeave', 'BufLeave', 'InsertEnter' }, {
	group = bryant_group,
	pattern = '*',
	callback = function()
		vim.opt_local.cursorline = false
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
		vim.diagnostic.enable(false)
	end,
})

-- :echo &ft to know floating window
-- clear cursor when exin nvim

autocmd('FileType', {
	desc = 'Disable auto-comment',
	command = 'set formatoptions-=o',
	group = bryant_group,
})

-- Auto-close quickfix with 'q' when in quickfix window
autocmd('FileType', {
	pattern = 'qf',
	callback = function()
		map('n', 'q', ':close<CR>')
	end,
})

autocmd('FileType', {
	pattern = 'fugitive',
	callback = function()
		map('n', 'q', ':close<CR>')
	end,
})

autocmd('TermOpen', {
	command = 'setlocal signcolumn=no',
})
