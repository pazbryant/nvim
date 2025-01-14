return {
	'ibhagwan/fzf-lua',
	dependencies = 'folke/trouble.nvim',
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
		{ '<C-t>', function() require('fzf-lua').live_grep_native() end, desc = 'Live grep' },
		{ '<M-b>', function() require('fzf-lua').buffers() end, desc = 'Live grep' },
		{ '<M-c>', function() require('fzf-lua').files() end, desc = 'Files' },
		{ '<M-d>', function() require('fzf-lua').lsp_document_symbols() end },
		{ '<leader>ht', function() require('fzf-lua').help_tags() end, desc = 'Help tags' },
		{ '<leader>th', function() require('fzf-lua').colorschemes() end, desc = 'Switch colorschemes' },
		{ '<leader>ws', function() require('fzf-lua').lsp_workspace_symbols() end },
		{ 'z=', function() require('fzf-lua').spell_suggest() end },
	},
}
