return {
	'mfussenegger/nvim-lint',
	lazy = false,
	enabled = true,
	config = function()
		local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
		local lint = require('lint')
		local enabled = false
		local autocmd_id = nil

		local function enable_linter()
			if enabled then
				return
			end
			autocmd_id = vim.api.nvim_create_autocmd(
				{ 'BufEnter', 'BufWritePost', 'InsertLeave' },
				{
					group = lint_augroup,
					callback = function()
						require('lint').try_lint()
					end,
				}
			)
			enabled = true
		end

		local function disable_linter()
			if not enabled then
				return
			end
			if autocmd_id then
				vim.api.nvim_del_autocmd(autocmd_id)
				autocmd_id = nil
			end
			vim.diagnostic.reset()
			enabled = false
		end

		local function toggle_linter()
			if enabled then
				disable_linter()
			else
				enable_linter()
			end
		end

		vim.api.nvim_create_user_command('ToggleLinter', function()
			toggle_linter()
		end, { nargs = 0 })

		lint.linters_by_ft = {
			sh = { 'shellcheck' },
			bash = { 'shellcheck' },
			lua = { 'luacheck' },
			c = { 'clangtidy' },
			go = { 'golangcilint' },
			python = { 'ruff' },
			markdown = { 'alex', 'markdownlint' },
			javascript = { 'eslint_d' },
			typescript = { 'eslint_d' },
			typescriptreact = { 'eslint_d' },
			javascriptreact = { 'eslint_d' },
		}
	end,
}
