return {
	'mfussenegger/nvim-lint',
	event = { 'BufReadPre', 'BufNewFile' },
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

		-- needs to be removed to be used with older eslint configuartions < 9
		local eslint_d = require('lint.linters.eslint_d')
		eslint_d.args = vim.tbl_extend('force', {
			'--config',
			function()
				return vim.fn.getcwd() .. '/eslint.config.js'
			end,
		}, eslint_d.args)

		local enabled = false
		local toggleLinter = function() end
		-- vim.api.nvim_create_user_command()

		vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
			callback = function()
				require('lint').try_lint()
			end,
		})
	end,
}
