return {
	'jake-stewart/multicursor.nvim',
	event = 'VeryLazy',
	branch = '1.0',
	config = function()
		local mc = require('multicursor-nvim')
		mc.setup()
		local map = vim.keymap.set

		-- stylua: ignore start
		map({ 'n', 'v' }, '<right>', mc.prevCursor, { desc = 'Multicursor next' })
		map('v', 'I', mc.insertVisual, { desc = 'Multicursor visual insert mode' })
		map({ 'n', 'v' }, '<left>', mc.nextCursor, { desc = 'Multicursor previous' })
		map('v', 'A', mc.appendVisual, { desc = 'Multicursor visual insert mode last' })
		map({ 'n', 'v' }, '<C-x>', mc.deleteCursor, { desc = 'Multicursor remove cursor' })
		map('n', '<c-leftmouse>', mc.handleMouse, { desc = 'Multicursor insert with mouse' })
		map({ 'n', 'v' }, '<c-n>', function() mc.matchAddCursor(1) end, { desc = 'Multicursor start' })
		map({ 'n', 'v' }, '<leader>A', mc.matchAllAddCursors, { desc = 'Multicursor add all occurrence' })
		map({ 'n', 'v' }, '<leader>s', function() mc.matchSkipCursor(1) end, { desc = 'Multicursor skip' })
		map({ 'n', 'v' }, '<leader>N', function() mc.matchAddCursor(-1) end, { desc = 'Multicursor minus one' })
		map({ 'n', 'v' }, '<leader>S', function() mc.matchSkipCursor(-1) end, { desc = 'Multicursor match skip backwards' })
		map('n', '<esc>', function() if not mc.cursorsEnabled() then mc.enableCursors() elseif mc.hasCursors() then mc.clearCursors() else vim.cmd('noh') end end, { desc = 'Multicursor clear cursors' })

		local hl = vim.api.nvim_set_hl
		hl(0, 'MultiCursorCursor', { link = 'Cursor' })
		hl(0, 'MultiCursorVisual', { link = 'Visual' })
		hl(0, 'MultiCursorSign', { link = 'SignColumn' })
		hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
	end,
}
