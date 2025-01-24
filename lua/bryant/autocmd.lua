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

autocmd('FileType', {
	desc = 'Disable auto-comment',
	command = 'set formatoptions-=o',
	group = bryant_group,
})

autocmd('TermOpen', {
	desc = 'remove colucmns in terminal',
	command = 'setlocal signcolumn=no',
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

autocmd('LspAttach', {
	group = bryant_group,
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end

		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local caps = client.server_capabilities
		local status = pcall(module, 'hlargs')
		if
			caps.semanticTokensProvider
			and caps.semanticTokensProvider.full
			and status
		then
			require('hlargs').disable_buf(args.buf)
		end
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

autocmd('FileType', {
	group = bryant_group,
	desc = 'Disable ufo in certain file types',
	pattern = {
		'dapui_watches',
		'dap-repl',
		'dapui_console',
		'dapui_stacks',
		'dapui_breakpoints',
		'dapui_scopes',
		'lazy',
	},
	callback = function()
		local status = pcall(module, 'ufo')
		if status then
			require('ufo').detach()
			vim.opt_local.foldenable = false
		end
	end,
})

autocmd('BufHidden', {
	group = bryant_group,
	desc = 'Remove unamed buffers',
	callback = function(event)
		if
			event.file == ''
			and vim.bo[event.buf].buftype == ''
			and not vim.bo[event.buf].modified
		then
			vim.schedule(function()
				pcall(vim.api.nvim_buf_delete, event.buf, {})
			end)
		end
	end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
	group = bryant_group,
	pattern = { '*.md', '*.markdown' },
	desc = 'Wrap text in markdown files',
	callback = function()
		vim.cmd('setfiletype markdown')
		vim.opt_local.wrap = true
		vim.opt_local.textwidth = 80
	end,
})

autocmd('BufEnter', {
	desc = 'Wrap lines in no file type',
	group = bryant_group,
	callback = function()
		if vim.bo.buftype == 'nofile' then
			vim.opt_local.wrap = true
			vim.opt_local.textwidth = 80
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
	group = bryant_group,
	pattern = { 'editorconfig' },
	callback = function()
		vim.opt_local.syntax = 'editorconfig'
	end,
})

-- Automatically update changed file in Vim
-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
	group = bryant_group,
	command = [[silent! if mode() != 'c' && !bufexists("[Command Line]") | checktime | endif]],
})

-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd('FileChangedShellPost', {
	group = bryant_group,
	command = [[echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]],
})
