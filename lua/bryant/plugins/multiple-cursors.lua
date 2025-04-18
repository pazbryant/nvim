return {
	'jake-stewart/multicursor.nvim',
	event = 'VeryLazy',
	branch = '1.0',
	config = function()
		local mc = require('multicursor-nvim')
		mc.setup()
		local map = vim.keymap.set

		-- stylua: ignore start
    map({ 'n', 'x' }, '<up>', function() mc.lineAddCursor(-1) end)
    map({ 'n', 'x' }, '<down>', function() mc.lineAddCursor(1) end)
    map({"n", "v"}, "<leader>q", mc.toggleCursor, { desc = "Toggle cursor" })
    map("v", "M", mc.matchCursors, { desc = 'Match cursors with regex' } )
    map('v', 'Q', mc.deleteCursor, { desc = 'Multicursor remove cursor' })
    map({ 'n', 'x' }, '<leader><up>', function() mc.lineSkipCursor(-1) end)
    map({ 'n', 'x' }, '<leader><down>', function() mc.lineSkipCursor(1) end)
    map({ 'n', 'v' }, '<right>', mc.nextCursor, { desc = 'Multicursor next' })
    map('v', 'I', mc.insertVisual, { desc = 'Multicursor visual insert mode' })
    map({ 'n', 'v' }, '<left>', mc.prevCursor, { desc = 'Multicursor previous' })
    map('v', 'A', mc.appendVisual, { desc = 'Multicursor visual insert mode last' })
    map('v', 'q', function() mc.matchSkipCursor(1) end, { desc = 'Multicursor skip' })
    map({ 'n', 'v' }, '<c-n>', function() mc.matchAddCursor(1) end, { desc = 'Multicursor start' })

		map(
			'n',
			'<esc>',
			function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				elseif mc.hasCursors() then
					mc.clearCursors()
				else vim.cmd('noh') end
			end,
			{ desc = 'Multicursor clear cursors' }
		)

		map({"v", "n"}, "<c-i>", mc.jumpForward, { desc = "Jump list multicursor" } )
		map({"v", "n"}, "<c-o>", mc.jumpBackward, { desc = "Jump list multicursor" } )

		local hl = vim.api.nvim_set_hl
		hl(0, 'MultiCursorCursor', { link = 'Cursor' })
		hl(0, 'MultiCursorVisual', { link = 'Visual' })
		hl(0, 'MultiCursorSign', { link = 'SignColumn' })
		hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
	end,
}
