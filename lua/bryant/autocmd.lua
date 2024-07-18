local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup(
		'bryant-highlight-yank',
		{ clear = true }
	),
	callback = function()
		vim.highlight.on_yank()
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

vim.cmd([[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:hor20
augroup END
]])

-- avoid auto-comment
vim.cmd([[
  augroup bryant_autocmds
    autocmd!
    autocmd FileType * setlocal formatoptions-=cro
  augroup END
]])
