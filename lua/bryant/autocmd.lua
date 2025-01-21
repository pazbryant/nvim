local api = vim.api
local map = vim.keymap.set
local autocmd = api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

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
	desc = 'Enable cursorline when leaving a window, buffer, or entering insert mode',
	group = bryant_group,
	pattern = '*',
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

autocmd({ 'WinLeave', 'BufLeave', 'InsertEnter' }, {
	desc = 'Disable cursorline when leaving a window, buffer, or entering insert mode',
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

autocmd('FileType', {
	desc = 'Disable auto-comment',
	command = 'set formatoptions-=o',
	group = bryant_group,
})

autocmd('RecordingEnter', {
	desc = 'notify when start macro',
	callback = function()
		vim.opt.cmdheight = 1
		local msg = string.format('key: %s', vim.fn.reg_recording())
		vim.notify(msg, vim.log.levels.INFO, {
			title = 'Macro Recording',
		})
	end,
})

autocmd('RecordingLeave', {
	desc = 'notify when finish macro',
	callback = function()
		vim.opt.cmdheight = 0
		vim.notify('has finished', vim.log.levels.INFO, {
			title = 'Macro Recording',
		})
	end,
})

autocmd('FileType', {
	group = bryant_group,
	desc = "Define windows to close with 'q'",
	pattern = {
		'gitcommit',
		'fugitive',
		'gitrebase',
		'dap-float',
		'gitconfig',
		'help',
		'startuptime',
		'qf',
		'lspinfo',
		'man',
		'checkhealth',
		'tsplayground',
		'markdown',
		'dap-float',
		'empty',
		'noice',
		'neotest-output',
		'neotest-summary',
		'neotest-output-panel',
		'nvcheatsheet',
		'grug-far',
		'grug-far-history',
		'grug-far-help',
	},
	callback = function()
		map('n', 'q', ':quit<CR>')
	end,
})

autocmd('BufHidden', {
	group = bryant_group,
	desc = 'Remove unamed buffers',
	callback = function(event)
		if event.file == '' and vim.bo[event.buf].buftype == '' and not vim.bo[event.buf].modified then
			vim.schedule(function()
				pcall(vim.api.nvim_buf_delete, event.buf, {})
			end)
		end
	end,
})

autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
	group = bryant_group,
	desc = 'Inteligent relative number',
	callback = function()
		if vim.opt.number:get() and vim.fn.mode() ~= 'i' then
			vim.opt.relativenumber = true
		end
	end,
})

autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
	group = bryant_group,
	desc = 'Inteligent relative number',
	callback = function()
		if vim.opt.number:get() then
			vim.opt.relativenumber = false
		end
	end,
})

autocmd('BufWritePre', {
	group = augroup('TrimWhiteSpaceGrp', { clear = true }),
	desc = 'Remove all trailing whitespace on save',
	command = [[:%s/\s\+$//e]],
})

autocmd({ 'FileType' }, {
	desc = 'enable_editorconfig_syntax',
	pattern = { 'editorconfig' },
	callback = function()
		vim.opt_local.syntax = 'editorconfig'
	end,
})
