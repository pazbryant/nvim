local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
if not mason_lspconfig or not lspconfig then
	return
end

vim.diagnostic.config({
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	virtual_text = false,
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

local function on_attach(client, bufnr)
	require('bryant.plugins.lsp.attach').on_attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = vim.tbl_deep_extend(
	'force',
	capabilities,
	require('blink.cmp').get_lsp_capabilities({
		textDocument = {
			completion = { completionItem = { snippetSupport = false } },
		},
	}, false)
)

capabilities = vim.tbl_deep_extend('force', capabilities, {
	textDocument = {
		semanticTokens = { dynamicRegistration = false },
		formatting = { dynamicRegistration = false },
		rangeFormatting = { dynamicRegistration = false },
	},
})

local servers = {
	jsonls = {
		settings = {
			json = {
				schemas = require('schemastore').json.schemas({
					ignore = {
						-- '.eslintrc',
						-- 'package.json',
					},
				}),
				validate = { enable = true },
			},
		},
	},

	yamlls = {
		settings = {
			yaml = {
				schemaStore = {
					enable = false,
				},
				schemas = require('schemastore').json.schemas({
					ignore = {
						-- '.eslintrc',
						-- 'package.json',
					},
				}),
				validate = { enable = true },
			},
		},
	},

	gopls = {
		cmd = { 'gopls' },
		settings = {
			gopls = {
				experimentalPostfixCompletions = true,
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
			},
		},
		init_options = {
			usePlaceholders = true,
		},
	},

	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = 'LuaJIT' },
				telemetry = { enable = false },
				diagnostics = {
					globals = {
						'vim',
						'describe',
						'it',
						'before_each',
						'after_each',
						'peding',
						'LazyVim',
					},
				},
			},
		},
	},
}

local ignored_servers = { 'ts_ls' }

mason_lspconfig.setup_handlers({
	function(server)
		local server_opts = vim.tbl_deep_extend('force', {
			capabilities = vim.deepcopy(capabilities),
		}, servers[server] or {})

		if vim.tbl_contains(ignored_servers, server) then
			return
		end

		server_opts.on_attach = on_attach

		require('lspconfig')[server].setup(server_opts)
	end,
})
