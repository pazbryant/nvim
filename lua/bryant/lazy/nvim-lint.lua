return {
	'mfussenegger/nvim-lint',
	enabled = true,
	event = 'InsertEnter',
	config = function()
		local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
		local lint = require('lint')

		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
			group = lint_augroup,
			callback = function()
				require('lint').try_lint()
			end,
		})

		lint.linters_by_ft = {
			sh = { 'shellcheck' },
			c = { 'clangtidy' }, -- installed by default
			go = { 'golangcilint' },
			python = { 'ruff' },
			markdown = { 'alex', 'markdownlint' },
		}
	end,
}
