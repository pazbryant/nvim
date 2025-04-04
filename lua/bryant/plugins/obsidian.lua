return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	cmd = {
		'ObsidianToday',
		'ObsidianTemplate',
		'ObsidianSearch',
		'ObsidianYesterday',
		'ObsidianQuickSwitch',
		'ObsidianPasteImg',
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
		completion = { nvim_cmp = false, min_chars = 2 },
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

		image_name_func = function()
			return string.format('%s-', os.time())
		end,

		follow_url_func = function(url)
			vim.ui.open(url) -- need Neovim 0.10.0+
		end,

		follow_img_func = function(img)
			vim.fn.jobstart({ 'xdg-open', img }) -- linux
		end,

		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
			name = 'fzf-lua',
			-- Optional, configure key mappings for the picker. These are the defaults.
			-- Not all pickers support all mappings.
			note_mappings = {
				-- Create a new note from your query.
				new = '<C-x>',
				-- Insert a link to the selected note.
				insert_link = '<C-l>',
			},
			tag_mappings = {
				-- Add tag(s) to current note.
				tag_note = '<C-x>',
				-- Insert a tag at the current location.
				insert_tag = '<C-l>',
			},
		},

		attachments = {
			img_folder = 'obsidian/files',
		},
	},
	keys = {
		-- stylua: ignore start
		{ '<leader>os', '<cmd>ObsidianSearch<cr>', desc = 'ObsidianSearch' },
		{ '<leader>ow', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Obsidian Quick Switch' },
		{ '<leader>ot', '<cmd>ObsidianToday<CR>', desc = 'Open obsidian daily today' },
		{ '<leader>oT', '<cmd>ObsidianTemplate<CR>', desc = 'Paste obsidian template current buffer' },
		{ '<leader>oy', '<cmd>ObsidianYesterday<CR>', desc = 'Search with obsidian' },
		{ '<leader>op', '<cmd>ObsidianPasteImg<CR>', desc = 'Obsidian paste image from clipboard' },
	},
}
