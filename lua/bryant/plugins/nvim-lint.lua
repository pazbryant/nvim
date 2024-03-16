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
			rust = { 'clippy' },
			javascriptreact = { 'eslint_d' },
			c = { 'clangtidy' },
		}

		local usercmd = vim.api.nvim_create_user_command
		usercmd('Lint', function()
			lint.try_lint(nil, { ignore_errors = true })
			vim.notify('Code has been linting', vim.log.levels.INFO)
		end, { desc = 'Lint file with nvim-lint' })
	end,
	keys = {
		{
			'<leader>l',
			'<cmd>Lint<CR>',
			desc = 'Nvim-lint Lint',
		},
	},
}
