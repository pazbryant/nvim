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
			markdown = { 'prettier' },
			sh = { 'shfmt' },
			rust = { 'rustfmt' }, -- rustfmt is installed thought rustup
			c = { 'clang-format' },
			go = { 'gofumpt', 'goimports' },
			['markdown.mdx'] = { 'prettier' },
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
