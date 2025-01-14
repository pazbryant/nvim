return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	cmd = 'Gitsigns',
	opts = {
		signs = {
			add = { text = '┃' },
			change = { text = '┃' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
			untracked = { text = '┆' },
		},
		signcolumn = true,
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function opts(desc)
				return { buffer = bufnr, desc = desc }
			end

			local map = vim.keymap.set

			map('n', ']g', function()
				if vim.wo.diff then
					return '[gh'
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return '<Ignore>'
			end, { expr = true })

			map('n', '[g', function()
				if vim.wo.diff then
					return '[gl'
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return '<Ignore>'
			end, { expr = true })

			-- stylua: ignore start
			map('n', '<leader>gr', gs.reset_hunk, opts('Gitsigns Reset Hunk'))
			map('n', '<leader>gp', gs.preview_hunk, opts('Gitsigns Preview Hunk'))
			map('n', '<leader>gb', gs.blame_line, opts('Gitsigns Blame Line'))
			map('n', '<leader>gl', gs.toggle_linehl, opts('Gitsigns Toggle linehl'))
			map('n', '<leader>gt', '<cmd> Gitsigns toggle_signs <CR>', opts('Gitsigns Toggle gitsigns'))
		end,
	},
}
