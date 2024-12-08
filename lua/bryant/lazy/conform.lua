return {
	'stevearc/conform.nvim',
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
	},
	keys = {
		{
			'<leader>um',
			function()
				require('conform').format({ lsp_fallback = true })
			end,
			desc = 'Format document with conform',
		},
	},
	config = function(_, opts)
		require('conform').setup(opts)
	end,
}
