return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	cmd = {
		'ObsidianToday',
		'ObsidianTemplate',
		'ObsidianNewFromTemplate',
		'ObsidianNew',
		'ObsidianTags',
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
		ui = { enable = true },
		templates = {
			subdir = 'Obsidian/Templates',
		},
		daily_notes = {
			folder = 'Daily',
			template = nil,
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
		attachments = {
			img_folder = 'Obsidian/Files',
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format('![%s](%s)', path.name, path)
			end,
		},
		image_name_func = function()
			return string.format('%s-', os.time())
		end,
	},
	keys = {
		{
			'<leader>od',
			'<cmd>ObsidianToday<CR>',
			desc = 'Open opsidian daily today',
		},
		{
			'<leader>ot',
			'<cmd>ObsidianTemplate<CR>',
			desc = 'Paste template current buffer',
		},
		{
			'<leader>oT',
			'<cmd>ObsidianNewFromTemplate<CR>',
			desc = 'New note from template',
		},
		{
			'<leader>on',
			'<cmd>ObsidianNew<CR>',
			desc = 'New obsidian note',
		},
		{
			'<leader>os',
			'<cmd>ObsidianTags<CR>',
			desc = 'Obsidian pick tags',
		},
	},
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}
