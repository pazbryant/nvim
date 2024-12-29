local api = vim.api
local map = vim.keymap.set
local autocmd = api.nvim_create_autocmd

local bryant_group = api.nvim_create_augroup('bryant_group', { clear = true })

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
