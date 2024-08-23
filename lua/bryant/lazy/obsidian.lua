return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	opts = {
		completion = { nvim_cmp = true, min_chars = 2 },
		dir = '/home/bryant/documents/github/notes',
		disable_frontmatter = true,
		new_notes_location = 'current_dir',
		daily_notes = { folder = 'obsidian/daily' },
		ui = { enable = true },
		templates = {
			subdir = 'obsidian/templates',
		},
		mappings = {
			['gf'] = {
				action = function()
					return require('obsidian').util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
		},
		attachments = {
			img_folder = 'obsidian/meta',
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format('![%s](%s)', path.name, path)
			end,
		},
		image_name_func = function()
			return string.format('%s-', os.time())
		end,
	},
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}
