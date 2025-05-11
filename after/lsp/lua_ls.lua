return {
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
					'pending',
					'LazyVim',
				},
			},
		},
	},
}
