return {
	'ibhagwan/fzf-lua',
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
		{ '<C-t>', function() require('fzf-lua').live_grep_native() end, desc = 'FzfLua Live grep' },
		{ '<M-b>', function() require('fzf-lua').buffers() end, desc = 'FzfLua Live grep' },
		{ '<M-c>', function() require('fzf-lua').files({ fd_opts = "--exclude .obsidian" }) end, desc = 'FzfLua Files' },
		{ '<M-d>', function() require('fzf-lua').lsp_document_symbols() end, desc = 'FzfLua document symbols' },
		{ '<leader>ht', function() require('fzf-lua').help_tags() end, desc = 'FzfLua Help tags' },
		{ '<leader>th', function() require('fzf-lua').colorschemes() end, desc = 'FzfLua Switch colorschemes' },
		{ '<leader>k', function() require('fzf-lua').keymaps() end, desc = 'FzfLua show keymaps' },
		{ '<leader>ws', function() require('fzf-lua').lsp_workspace_symbols() end, desc = 'FzfLua workspace symbols' },
		{ 'z=', function() require('fzf-lua').spell_suggest() end, desc = 'FzfLua spell suggestions' },
	},
}
