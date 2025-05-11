return {
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
}
