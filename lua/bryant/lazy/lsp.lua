return {
	'neovim/nvim-lspconfig',
	lazy = false,
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup(
				'bryant-lsp-attach',
				{ clear = true }
			),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set(
						'n',
						keys,
						func,
						{ buffer = event.buf, desc = 'LSP: ' .. desc }
					)
				end

				local rename = function()
					if pcall(require, 'inc_rename') then
						return ':IncRename ' .. vim.fn.expand('<cword>')
					else
						vim.lsp.buf.rename()
					end
				end

				local diagnostic_goto = function(next, severity)
					local go = next and vim.diagnostic.goto_next
						or vim.diagnostic.goto_prev
					severity = severity and vim.diagnostic.severity[severity] or nil
					return function()
						go({ severity = severity })
					end
				end

				map('go', vim.diagnostic.open_float, 'Line Diagnostics')
				map('gd', vim.lsp.buf.definition, 'Goto Definition')
				map('gr', vim.lsp.buf.references, 'References')
				map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
				map('gI', vim.lsp.buf.implementation, 'Goto Implementation')
				map('gt', vim.lsp.buf.type_definition, 'Goto Type Definition')
				map('gK', vim.lsp.buf.signature_help, 'Signature Help')
				map(']d', diagnostic_goto(true), 'Next Diagnostic')
				map('[d', diagnostic_goto(false), 'Prev Diagnostic')
				map(']e', diagnostic_goto(true, 'ERROR'), 'Next Error')
				map('[e', diagnostic_goto(false, 'ERROR'), 'Prev Error')
				map(']w', diagnostic_goto(true, 'WARN'), 'Next Warning')
				map('[w', diagnostic_goto(false, 'WARN'), 'Prev Warning')
				map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
				map('<leader>rn', rename, 'Rename')
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend(
			'force',
			capabilities,
			require('cmp_nvim_lsp').default_capabilities()
		)

		-- json snippetSupport
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local servers = {
			cssls = {},
			pyright = {},
			clangd = {},
			marksman = {},
			html = {},
			bashls = {},
			ts_ls = {},
			emmet_language_server = {},
			gopls = {
				cmd = { 'gopls' },
				-- on_attach = on_attach,
				capabilities = capabilities,
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
						version = 'LuaJIT',
						telemetry = {
							enable = false,
						},
						diagnostics = {
							globals = {
								'vim',
								'describe',
								'it',
								'before_each',
								'after_each',
								'pending',
							},
						},
					},
				},
			},
		}

		require('mason').setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			-- lua
			'stylua',
			'luacheck',

			-- web dev
			'prettierd',
			'prettier',

			-- bash
			'shfmt',
			'shellcheck',

			-- c
			'clang-format',

			-- golang
			'gofumpt',
			'goimports',
			'golangci-lint',

			-- python
			'black',
			'ruff',
			'isort',

			-- markdown
			'alex',
			'markdownlint',

			-- javascript
			'eslint_d',
		})
		require('mason-tool-installer').setup({
			ensure_installed = ensure_installed,
		})

		local ignored_servers = { 'ts_ls' }
		require('mason-lspconfig').setup({
			handlers = {
				function(server_name)
					if vim.tbl_contains(ignored_servers, server_name) then
						return
					end
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend(
						'force',
						{},
						capabilities,
						server.capabilities or {}
					)
					require('lspconfig')[server_name].setup(server)
				end,
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
