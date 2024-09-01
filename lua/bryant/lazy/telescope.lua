return {
	'nvim-telescope/telescope.nvim',
	keys = { '<M-c>', '<C-t>', '<leader>h', '<leader>th' },
	cmd = 'Telescope',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable('make') == 1
			end,
		},
	},
	config = function()
		require('telescope').setup({
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
			defaults = {
				vimgrep_arguments = {
					'rg',
					'-L',
					'--color=never',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--smart-case',
					'-u',
					'-u',
				},
				initial_mode = 'insert',
				selection_strategy = 'reset',
				sorting_strategy = 'ascending',
				layout_strategy = 'horizontal',
				layout_config = {
					horizontal = {
						prompt_position = 'top',
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.7,
					height = 0.8,
					preview_cutoff = 120,
				},
				file_sorter = require('telescope.sorters').get_fuzzy_file,
				file_ignore_patterns = {
					'node_modules',
					'.git/',
					'yarn.lock',
					'go.sum',
					'go.mod',
					'tags',
					'mocks',
					'refactoring',
					'^node_modules/',
					'^build/',
					'^dist/',
					'^.obsidian/',
					'^target/',
					'^vendor/',
					'^lazy%-lock%.json$',
					'^package%-lock%.json$',
				},
				generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
				path_display = { 'truncate' },
				winblend = 0,
				border = {},
				borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
				set_env = { ['COLORTERM'] = 'truecolor' },
				file_previewer = require('telescope.previewers').vim_buffer_cat.new,
				grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
				qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
				buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
				mappings = {
					n = { ['q'] = require('telescope.actions').close },
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = 'smart_case',
				},
			},
		})
		pcall(require('telescope').load_extension, 'fzf')
		local map = vim.keymap.set
		map(
			'n',
			'<M-c>',
			'<cmd> Telescope find_files previewer=false follow=true no_ignore=true hidden=true <CR>'
		)
		map('n', '<C-t>', '<cmd> Telescope live_grep <CR>')
		map('n', '<leader>h', '<cmd> Telescope help_tags <CR>')
		map('n', '<leader>th', '<cmd> Telescope colorscheme <CR>')
	end,
}
