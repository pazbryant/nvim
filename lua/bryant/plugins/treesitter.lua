return {
	'nvim-treesitter/nvim-treesitter',
	event = 'BufEnter',
	build = ':TSUpdate',
	dependencies = {
		{
			'andymass/vim-matchup',
			config = function()
				vim.g.matchup_matchparen_offscreen = { method = 'popup' }
			end,
		},
	},
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
			'vimdoc',
			'javascript',
			'typescript',
			'c',
			'lua',
			'rust',
			'jsdoc',
			'bash',
			'markdown',
			'markdown_inline',
		},
		auto_install = true,
		indent = { enable = true },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { 'markdown' },
			disable = function(lang, buf)
				if lang == 'html' then
					vim.notify('treesitter disabled in html', vim.log.levels.INFO, {
						title = 'Treesitter',
					})
					return true
				end

				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats =
					pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					vim.notify(
						'File larger than 100KB treesitter disabled for performance',
						vim.log.levels.WARN,
						{ title = 'Treesitter' }
					)
					return true
				end
			end,
		},
		playground = { enable = false },
	},
	config = function(_, opts)
		require('nvim-treesitter.configs').setup(opts)
	end,
}
