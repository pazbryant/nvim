return {
	'neovim/nvim-lspconfig',
	event = 'BufEnter',
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
				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
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
			clangd = {},
			marksman = {},
			html = {},
			bashls = {},
			tsserver = {},
			gopls = {},
			dockerls = {},
			docker_compose_language_service = {},
			jsonls = {},
			terraformls = {},
			yamlls = {},
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = { 'vim' },
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
		}

		require('mason').setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			-- web dev
			'stylua',
			'prettierd',
			'prettier',
			'eslint_d',
			'emmet_language_server',

			-- markdown
			'alex',
			'markdownlint',

			-- bash
			'shellcheck',
			'shfmt',

			-- c
			'clang-format',

			-- golang
			'gofumpt',
			'goimports',
			'golangci-lint',

			-- json
			'jsonlint',

			-- yaml
			'yamllint',
		})
		require('mason-tool-installer').setup({
			ensure_installed = ensure_installed,
		})

		local ignored_servers = { 'tsserver' }
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
			virtual_text = false,
		})
	end,
}
