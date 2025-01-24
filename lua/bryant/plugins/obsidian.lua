return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	cmd = {
		'ObsidianToday',
		'ObsidianTemplate',
	},
	opts = {
		workspaces = {
			{
				name = 'personal',
				path = '~/Documents/github/notes',
			},
			{
				name = 'youtube',
				path = '~/Documents/github/youtube',
			},
		},
		completion = { nvim_cmp = true, min_chars = 2 },
		disable_frontmatter = true,
		ui = { enable = false },
		templates = {
			subdir = 'obsidian/templates',
		},
		daily_notes = {
			folder = 'daily',
			template = 'obsidian/templates/daily/today-template.md',
		},
		mappings = {
			['gf'] = {
				action = function()
					return require('obsidian').util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			['<cr>'] = {
				action = function()
					return require('obsidian').util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
	},
	-- stylua: ignore start
	keys = {
		{ '<leader>ot', '<cmd>ObsidianToday<CR>', desc = 'Open obsidian daily today' },
		{ '<leader>oT', '<cmd>ObsidianTemplate<CR>', desc = 'Paste obsidian template current buffer' },
	},
}
