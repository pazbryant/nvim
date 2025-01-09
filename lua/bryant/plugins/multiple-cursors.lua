return {
	'jake-stewart/multicursor.nvim',
	branch = '1.0',
	keys = {
		{ '<C-n>', mode = { 'n', 'v' } },
		{ '<up>', mode = { 'n', 'v' } },
		{ '<down>', mode = { 'n', 'v' } },
		{ '<leader>A', mode = { 'n', 'v' } },
		{ '<left>', mode = { 'n', 'v' } },
		{ '<right>', mode = { 'n', 'v' } },
		{ '<C-x>', mode = { 'n', 'v' } },
		{ '<esc>', mode = 'n' },
		{ 'I', mode = 'v' },
		{ 'A', mode = 'v' },
	},
	config = function()
		local mc = require('multicursor-nvim')
		mc.setup()
		local map = vim.keymap.set
		-- Add or skip adding a new cursor by matching word/selection
		map({ 'n', 'v' }, '<C-n>', function()
			mc.matchAddCursor(1)
		end)
		-- Add or skip cursor above/below the main cursor.
		map({ 'n', 'v' }, '<up>', function()
			mc.lineAddCursor(-1)
		end)
		map({ 'n', 'v' }, '<down>', function()
			mc.lineAddCursor(1)
		end)
		-- Add all matches in the document
		map({ 'n', 'v' }, '<leader>A', mc.matchAllAddCursors)
		-- Rotate the main cursor.
		map({ 'n', 'v' }, '<left>', mc.nextCursor)
		map({ 'n', 'v' }, '<right>', mc.prevCursor)
		-- Delete the main cursor.
		map({ 'n', 'v' }, '<C-x>', mc.deleteCursor)
		map('n', '<esc>', function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				-- Default <esc> handler.
			end
		end)
		-- Append/insert for each line of visual selections.
		map('v', 'I', mc.insertVisual)
		map('v', 'A', mc.appendVisual)
		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, 'MultiCursorCursor', { link = 'Cursor' })
		hl(0, 'MultiCursorVisual', { link = 'Visual' })
		hl(0, 'MultiCursorSign', { link = 'SignColumn' })
		hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
	end,
}
