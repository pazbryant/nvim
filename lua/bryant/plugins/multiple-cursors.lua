return {
	'jake-stewart/multicursor.nvim',
	event = 'VeryLazy',
	branch = '1.0',
	config = function()
		local mc = require('multicursor-nvim')
		mc.setup()
		local map = vim.keymap.set

		-- stylua: ignore start
		map({ 'n', 'v' }, '<c-n>', function() mc.matchAddCursor(1) end, { desc = 'Multicursor start' })
		map({ 'n', 'v' }, '<leader>A', mc.matchAllAddCursors, { desc = 'Multicursor add all occurrence' })
		map('n', '<esc>', function() if not mc.cursorsEnabled() then mc.enableCursors() elseif mc.hasCursors() then mc.clearCursors() else vim.cmd('noh') end end, { desc = 'Multicursor clear cursors' })

		map({ 'n', 'v' }, '<right>', mc.nextCursor, { desc = 'Multicursor next' })
		map({ 'n', 'v' }, '<left>', mc.prevCursor, { desc = 'Multicursor previous' })

		map({"n", "v"}, "<up>", function()     mc.lineAddCursor(-1) end)
		map({ "n", "v" }, "<down>", function() mc.lineAddCursor(1) end)

		map({ "n", "v" }, "<leader><up>", function() mc.lineSkipCursor(-1) end)
		map({ "n", "v" }, "<leader><down>", function() mc.lineSkipCursor(1) end)

		map('v', 'q', mc.deleteCursor, { desc = 'Multicursor remove cursor' })
		map('v', 'Q', function() mc.matchSkipCursor(1) end, { desc = 'Multicursor skip' })

		map('v', 'A', mc.appendVisual, { desc = 'Multicursor visual insert mode last' })
		map('v', 'I', mc.insertVisual, { desc = 'Multicursor visual insert mode' })

		map('n', '<c-leftmouse>', mc.handleMouse, { desc = 'Multicursor insert with mouse' })

		local hl = vim.api.nvim_set_hl
		hl(0, 'MultiCursorCursor', { link = 'Cursor' })
		hl(0, 'MultiCursorVisual', { link = 'Visual' })
		hl(0, 'MultiCursorSign', { link = 'SignColumn' })
		hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
	end,
}
