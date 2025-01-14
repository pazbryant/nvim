return {
	'jake-stewart/multicursor.nvim',
	branch = '1.0',
	config = function()
		local mc = require('multicursor-nvim')
		mc.setup()
		local map = vim.keymap.set

		map({ 'n', 'v' }, '<c-n>', function()
			mc.matchAddCursor(1)
		end)
		map({ 'n', 'v' }, '<leader>s', function()
			mc.matchSkipCursor(1)
		end)
		map({ 'n', 'v' }, '<leader>N', function()
			mc.matchAddCursor(-1)
		end)
		map({ 'n', 'v' }, '<leader>S', function()
			mc.matchSkipCursor(-1)
		end)

		map({ 'n', 'v' }, '<left>', mc.nextCursor)
		map({ 'n', 'v' }, '<right>', mc.prevCursor)

		map('n', '<c-leftmouse>', mc.handleMouse)

		-- Add all matches in the document
		map({ 'n', 'v' }, '<leader>A', mc.matchAllAddCursors)

		map({ 'n', 'v' }, '<C-x>', mc.deleteCursor)

		map('n', '<esc>', function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				vim.cmd('noh')
			end
		end)

		map('v', 'I', mc.insertVisual)
		map('v', 'A', mc.appendVisual)

		local hl = vim.api.nvim_set_hl
		hl(0, 'MultiCursorCursor', { link = 'Cursor' })
		hl(0, 'MultiCursorVisual', { link = 'Visual' })
		hl(0, 'MultiCursorSign', { link = 'SignColumn' })
		hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
	end,
	keys = {
		{ '<C-n>', mode = { 'n', 'v' } },
		{ '<esc>', mode = 'n' },
	},
}
