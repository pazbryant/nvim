return {
	'ibhagwan/fzf-lua',
	opts = function()
		local actions = require('fzf-lua').actions
		local file_ignore_patterns = {
			'tags',
			'*.pyc',
			'.git/',
			'mocks',
			'.git/',
			'go.mod',
			'.git',
			'dist/',
			'go.sum',
			'build/',
			'zig-out',
			'.docker',
			'vendor/',
			'target/',
			'yarn.lock',
			'zig-cache',
			'refactoring',
			'__pycache__',
			'node_modules/',
			'node_modules',
			'lazy-lock.json',
			'lazy%-lock%.json$',
			'package%-lock%.json$',
		}

		local fd_exclude_args = ''
		for _, pattern in ipairs(file_ignore_patterns) do
			fd_exclude_args = fd_exclude_args .. " --exclude '" .. pattern .. "'"
		end

		local rg_exclude_args = ''
		for _, pattern in ipairs(file_ignore_patterns) do
			rg_exclude_args = rg_exclude_args .. " --glob '!" .. pattern .. "'"
		end

		return {
			profile = {
				enabled = true,
				default = 'max-perf',
			},
			winopts = {
				height = 0.70,
				width = 0.70,
			},
			actions = {
				files = {
					['ctrl-s'] = actions.file_split,
					['ctrl-v'] = actions.file_vsplit,
					['ctrl-h'] = actions.toggle_hidden,
					['ctrl-i'] = actions.toggle_ignore,
					['enter'] = actions.file_edit_or_qf,
					['ctrl-q'] = { fn = actions.file_sel_to_qf, prefix = 'select-all' },
				},
			},
			previewers = {
				builtin = {
					extensions = {
						['png'] = { 'chafa', '{file}' },
						['jpg'] = { 'chafa', '{file}' },
						['jpeg'] = { 'chafa', '{file}' },
						['gif'] = { 'chafa', '{file}' },
						['webp'] = { 'chafa', '{file}' },
						['svg'] = { 'chafa', '{file}' },
					},
				},
			},
			files = {
				fd_opts = '--color=never --type f' .. fd_exclude_args,
			},
			grep = {
				rg_opts = '--column --line-number --no-heading --color=always --smart-case'
					.. rg_exclude_args,
			},
			live_grep = {
				rg_opts = '--column --line-number --no-heading --color=always --smart-case'
					.. rg_exclude_args,
			},
		}
	end,
  -- stylua: ignore start
	keys = {
    { '<leader>fz', "<cmd> FzfLua <CR>" , desc = 'FzfLua' },
    { '<c-p>', function() require('fzf-lua').files() end, desc = 'FzfLua Files' },
    { '<m-c>', function() require('fzf-lua').buffers() end, desc = 'FzfLua buffers' },
    { '<leader>k', function() require('fzf-lua').keymaps() end, desc = 'FzfLua show keymaps' },
    { '<leader>ht', function() require('fzf-lua').help_tags() end, desc = 'FzfLua Help tags' },
    { '<c-t>', function() require('fzf-lua').live_grep_native() end, desc = 'FzfLua Live grep' },
    { 'z=', function() require('fzf-lua').spell_suggest() end, desc = 'FzfLua spell suggestions' },
    { '<leader>th', function() require('fzf-lua').colorschemes() end, desc = 'FzfLua Switch colorschemes' },
	},
}
