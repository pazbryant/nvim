return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	cmd = 'Gitsigns',
	opts = {
		signcolumn = false,
		signs = {
			add = { text = '┃' },
			change = { text = '┃' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
			untracked = { text = '┆' },
		},
		on_attach = function(bufnr)
			local gs = require('gitsigns')
			local v = vim

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				v.keymap.set(mode, l, r, opts)
			end

			map('n', ']g', function()
				if v.wo.diff then
					v.cmd.normal({ ']g', bang = true })
				else
					gs.nav_hunk('next')
				end
			end)

			map('n', '[g', function()
				if v.wo.diff then
					v.cmd.normal({ '[g', bang = true })
				else
					gs.nav_hunk('prev')
				end
			end)

			-- stylua: ignore start
      map('n', '<leader>gr', gs.reset_hunk, { desc = 'Gitsigns Reset Hunk' })
      map('n', '<leader>gb', gs.blame_line, { desc = 'Gitsigns Blame Line' })
      map('n', '<leader>gs', gs.toggle_signs, { desc = 'Gitsigns Toggle Signs' })
      map('n', '<leader>gp', gs.preview_hunk, { desc = 'Gitsigns Preview Hunk' })
      map('n', '<leader>gl', gs.toggle_linehl, { desc = 'Gitsigns Toggle linehl' })
		end,
	},
}
