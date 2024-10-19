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

				map(
					'gd',
					require('telescope.builtin').lsp_definitions,
					'[G]oto [D]efinition'
				)
				map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
				map(
					'gr',
					require('telescope.builtin').lsp_references,
					'[G]oto [R]eferences'
				)
				map(
					'gI',
					require('telescope.builtin').lsp_implementations,
					'[G]oto [I]mplementation'
				)
				map(
					'<leader>D',
					require('telescope.builtin').lsp_type_definitions,
					'Type [D]efinition'
				)
				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
				map(
					'<leader>ds',
					require('telescope.builtin').lsp_document_symbols,
					'[D]ocument [S]ymbols'
				)

				-- Fuzzy find all the symbols in your current workspace.
				--  Similar to document symbols, except searches over your entire project.
				map(
					'<leader>ws',
					require('telescope.builtin').lsp_dynamic_workspace_symbols,
					'[W]orkspace [S]ymbols'
				)

				vim.keymap.set('i', '<C-s>', function()
					vim.lsp.buf.signature_help()
				end, { desc = 'signature_help' })
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
