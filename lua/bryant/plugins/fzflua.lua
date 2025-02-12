return {
	'ibhagwan/fzf-lua',
	dependencies = 'nvim-tree/nvim-web-devicons',
	cmd = 'FzfLua',
	opts = {
		profile = {
			enabled = true,
			default = 'max-perf', -- Fixed typo from 'max-pref'
		},
		keymap = {
			fzf = {
				['ctrl-q'] = 'select-all+accept',
			},
		},
		winopts = {
			height = 0.70,
			width = 0.70,
		},
	},
	-- stylua: ignore start
	keys = {
		{ '<m-b>', function() require('fzf-lua').buffers() end, desc = 'FzfLua Live grep' },
		{ '<leader>ht', function() require('fzf-lua').help_tags() end, desc = 'FzfLua Help tags' },
		{ '<leader>k', function() require('fzf-lua').keymaps() end, desc = 'FzfLua show keymaps' },
		{ '<c-t>', function() require('fzf-lua').live_grep_native() end, desc = 'FzfLua Live grep' },
		{ 'z=', function() require('fzf-lua').spell_suggest() end, desc = 'FzfLua spell suggestions' },
		{ '<m-d>', function() require('fzf-lua').lsp_document_symbols() end, desc = 'FzfLua document symbols' },
		{ '<leader>th', function() require('fzf-lua').colorschemes() end, desc = 'FzfLua Switch colorschemes' },
		{ '<leader>ws', function() require('fzf-lua').lsp_workspace_symbols() end, desc = 'FzfLua workspace symbols' },
		{ '<c-p>', function() require('fzf-lua').files({ fd_opts = "--exclude .obsidian" }) end, desc = 'FzfLua Files' },
		{ '<m-t>', function() require('fzf-lua').live_grep_native({ cwd = vim.fn.expand('%:h') }) end, desc = 'FzfLua Live grep' },
		{ '<m-c>', function() require('fzf-lua').files({ fd_opts = "--exclude .obsidian", cwd = vim.fn.expand('%:h') }) end, desc = 'FzfLua Files' },
	},
}
