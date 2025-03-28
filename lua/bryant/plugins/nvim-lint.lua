return {
	'mfussenegger/nvim-lint',
	cmd = 'Lint',
	config = function()
		local lint = require('lint')
		lint.linters_by_ft = {
			sh = { 'shellcheck' },
			bash = { 'shellcheck' },
			zsh = { 'shellcheck' },
			lua = { 'luacheck' },
			go = { 'golangcilint' },
			python = { 'ruff' },
			markdown = { 'alex', 'markdownlint' },
			javascript = { 'eslint_d' },
			typescript = { 'eslint_d' },
			typescriptreact = { 'eslint_d' },
			javascriptreact = { 'eslint_d' },
		}

		local v = vim

		-- this works with the newest eslint configuration, not older one
		local eslint_d = require('lint.linters.eslint_d')
		eslint_d.args = v.tbl_extend('force', {
			'--config',
			function()
				return v.fn.getcwd() .. '/eslint.config.js'
			end,
		}, eslint_d.args)

		local usercmd = v.api.nvim_create_user_command
		usercmd('Lint', function()
			require('lint').try_lint()
			vim.notify('Code has been linting', vim.log.levels.INFO)
		end, { desc = 'Lint file with nvim-lint' })
	end,
	keys = {
		{
			'<leader>l',
			'<cmd>Lint<CR>',
			desc = 'Nvim-lint lint',
		},
	},
}
