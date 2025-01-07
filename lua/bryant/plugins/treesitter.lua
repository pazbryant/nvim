return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		{
			'andymass/vim-matchup',
			config = function()
				vim.g.matchup_matchparen_offscreen = { method = 'popup' }
			end,
		},
	},
	event = 'BufEnter',
	build = ':TSUpdate',
	opts = {
		matchup = {
			enable = true, -- mandatory, false will disable the whole extension
		},
		-- NOTE: Treesitter incremental selection key binds
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = 'gnn', -- set to `false` to disable one of the mappings
				node_incremental = 'gni',
				scope_incremental = 'gns',
				node_decremental = 'gnd',
			},
		},
		ensure_installed = {
			'vim',
			'lua',
			'bash',
			'json',
			'json5',
			'jq',
			'yaml',
			'regex',
			'toml',
			'vimdoc',
			'dockerfile',
			'graphql',
			'hurl',
			'git_config',
			'gitignore',
			'http',
			'fish',
			'markdown',
			'markdown_inline',
			'javascript',
			'typescript',
			'tsx',
			'html',
			'css',
			'c',
			'terraform',
			'sxhkdrc',
			'nix',
			'python',
			-- golang
			'go',
			'gosum',
			'gomod',
			'gotmpl',
			'gowork',
			'gitcommit',
		},
		auto_install = true,
		indent = { enable = true },
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		playground = { enable = false },
	},
	config = function(_, opts)
		require('nvim-treesitter.configs').setup(opts)
	end,
}
