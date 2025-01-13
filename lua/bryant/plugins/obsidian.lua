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
		'ObsidianFollowLink',
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
			template = 'obsidian/templates/daily-template.md',
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
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format('![%s](%s)', path.name, path)
			end,
		},
		image_name_func = function()
			return string.format('%s-', os.time())
		end,
	},
	-- stylua: ignore start
	keys = {
		{ '<leader>od', '<cmd>ObsidianToday<CR>', desc = 'Open obsidian daily today' },
		{ '<leader>ot', '<cmd>ObsidianTemplate<CR>', desc = 'Paste template current buffer' },
		{ '<leader>oT', '<cmd>ObsidianNewFromTemplate<CR>', desc = 'New note from template' },
		{ '<leader>on', '<cmd>ObsidianNew<CR>', desc = 'New obsidian note' },
		{ '<leader>os', '<cmd>ObsidianTags<CR>', desc = 'Obsidian pick tags' },
	},
}
