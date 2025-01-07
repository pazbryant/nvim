return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	keys = {
		{
			'<C-f>',
			function()
				require('conform').format({ lsp_format = 'fallback' })
				vim.notify('Code has been formated', 'info')
			end,
			desc = '[F]ormat buffer',
		},
	},
	opts = {
		notify_on_error = true,
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
			bash = { 'shfmt' },
			zsh = { 'shfmt' },
			c = { 'clang-format' },
			go = { 'gofumpt', 'goimports' },
			python = { 'black', 'isort' },
			toml = { 'taplo' },
			['markdown.mdx'] = { 'markdownlint' },
		},
	},
	config = function(_, opts)
		require('conform').setup(opts)
	end,
}
