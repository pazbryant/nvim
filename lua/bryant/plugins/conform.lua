return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	keys = {
		{
			'<leader>um',
			function()
				require('conform').format({ lsp_fallback = true })
			end,
			desc = 'Format document with conform',
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			javascript = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			typescript = { 'prettierd' },
			typescriptreact = { 'prettierd' },
			css = { 'prettierd' },
			html = { 'prettierd' },
			json = { 'prettierd' },
			jsonc = { 'prettierd' },
			scss = { 'prettier' },
			less = { 'prettier' },
			yaml = { 'prettier' },
			markdown = { 'markdownlint' },
			sh = { 'shfmt' },
			c = { 'clang-format' },
			go = { 'gofumpt', 'goimports' },
			python = { 'black', 'isort' },
			['markdown.mdx'] = { 'markdownlint' },
		},
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_fallback = true }
		end,
	},
	config = function(_, opts)
		vim.api.nvim_create_user_command('FormatDisable', function(args)
			-- `FormatDisable!` will disable formatting just for this buffer
			if args.bang then
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = 'Disable autoformat-on-save',
			bang = true,
		})
		vim.api.nvim_create_user_command('FormatEnable', function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = 'Re-enable autoformat-on-save',
		})
		require('conform').setup(opts)
	end,
}
