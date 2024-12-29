return {
	'kevinhwang91/nvim-ufo',
	event = 'BufEnter',
	dependencies = 'kevinhwang91/promise-async',
	config = function()
		-- Handler for LSP fold capabilities

		local v = vim
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (' 󰁂 %d '):format(endLnum - lnum)
			local sufWidth = v.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = v.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = v.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, 'UFOFoldedEllipsis' })
			return newVirtText
		end

		-- UFO setup
		require('ufo').setup({
			provider_selector = function()
				return { 'treesitter', 'indent' }
			end,
			fold_virt_text_handler = handler,
			preview = {
				win_config = {
					border = 'rounded',
					winblend = 0,
					winhighlight = 'Normal:Normal',
				},
			},
			enable_get_fold_virt_text = true,
			open_fold_hl_timeout = 400,
			close_fold_kinds_for_ft = {
				default = { 'imports', 'comment' },
				json = { 'array' },
				yaml = { 'sequence' },
			},
		})

		-- Highlight configuration
		local sethl = vim.api.nvim_set_hl
		local fold_color = '#ff007c'
		local fold_column_color = '#7b3982'

		-- UFO highlights
		sethl(0, 'UFOFoldedEllipsis', { fg = fold_color, bold = true })
		sethl(0, 'Folded', { fg = fold_color, bg = '#2d2d2d', bold = true })

		-- Statuscolumn highlights
		sethl(0, 'FoldColumn', { fg = fold_column_color, bold = false })
		sethl(0, 'LineNr', { fg = fold_column_color, bold = false })
		sethl(0, 'CursorLineNr', { fg = fold_column_color, bold = false })

		-- Keymaps
		v.keymap.set('n', 'zR', require('ufo').openAllFolds)
		v.keymap.set('n', 'zM', require('ufo').closeAllFolds)
		v.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
		v.keymap.set('n', 'zm', require('ufo').closeFoldsWith)
		v.keymap.set('n', 'K', function()
			local winid = require('ufo').peekFoldedLinesUnderCursor()
			if not winid then
				v.lsp.buf.hover()
			end
		end)

		-- Set foldcolumn
		v.o.foldcolumn = '1'
		v.o.foldlevel = 99
		v.o.foldlevelstart = 99
		v.o.foldenable = true
	end,
}
