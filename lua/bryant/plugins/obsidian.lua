return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	cmd = {
		'ObsidianToday',
		'ObsidianTemplate',
		'ObsidianNew',
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

		preferred_link_style = 'markdown', -- wiki/markdown

		follow_url_func = function(url)
			-- vim.fn.jobstart({"xdg-open", url})  -- linux
			vim.ui.open(url) -- need Neovim 0.10.0+
		end,

		-- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
		-- file it will be ignored but you can customize this behavior here.
		---@param img string
		follow_img_func = function(img)
			vim.fn.jobstart({ 'xdg-open', img }) -- linux
		end,

		attachments = {
			img_folder = 'obsidian/files',
			img_name_func = function()
				return string.format('%s-%s', os.time())
			end,

			-- A function that determines the text to insert in the note when pasting an image.
			-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
			-- This is the default implementation.
			---@param client obsidian.Client
			---@param path obsidian.Path the absolute path to the image file
			---@return string
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format('![%s](%s)', path.name, path)
			end,
		},
	},
	-- stylua: ignore start
	keys = {
		{ '<leader>ot', '<cmd>ObsidianToday<CR>', desc = 'Open obsidian daily today' },
		{ '<leader>oT', '<cmd>ObsidianTemplate<CR>', desc = 'Paste obsidian template current buffer' },
		{ '<leader>on', '<cmd>ObsidianNew<CR>', desc = 'New obsidian note' },
	},
}
