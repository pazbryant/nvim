return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
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
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = 'gnn', -- set to `false` to disable one of the mappings
				node_incremental = 'grn',
				scope_incremental = 'grc',
				node_decremental = 'grm',
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					['ic'] = {
						query = '@class.inner',
						desc = 'Select inner part of a class region',
					},
					['as'] = {
						query = '@scope',
						query_group = 'locals',
						desc = 'Select language scope',
					},
				},
				selection_modes = {
					['@parameter.outer'] = 'v', -- charwise
					['@function.outer'] = 'V', -- linewise
					['@class.outer'] = '<c-v>', -- blockwise
				},
				include_surrounding_whitespace = true,
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
			'rust',
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
