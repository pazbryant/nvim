vim.diagnostic.config({
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	virtual_text = false,
	virtual_lines = false,
	signs = {
		text = { ERROR = '󰅚', WARN = '󰀪', HINT = '󰌶', INFO = '󰋽' },
	},
	float = {
		focusable = true,
		style = 'minimal',
		border = 'single',
		source = true,
		max_width = 100,
		header = { ' Diagnostics', 'Bold' },
		prefix = function(ctx)
			local severity = vim.diagnostic.severity[ctx.severity]
			return '  ', 'Diagnostic' .. severity
		end,
	},
})

vim.lsp.config('*', {
	capabilities = {
		textDocument = {
			semanticTokens = nil,
		},
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'Attach lsp user custom keybinds',
	group = vim.api.nvim_create_augroup('bryant-lsp', { clear = true }),
	callback = function()
		require('bryant.plugins.lsp.attach').on_attach(client, bufnr)
	end,
})
