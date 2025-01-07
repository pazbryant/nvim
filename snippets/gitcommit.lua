---@diagnostic disable: undefined-global

return {
	-- feat: A new feature
	s('feat', {
		t('feat: '),
		i(1, 'short description of the feature'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'detailed explanation of the feature'),
		t({ '', '', 'FOOTER:', '' }),
		i(3, 'e.g., BREAKING CHANGE: description'),
	}),

	-- fix: A bug fix
	s('fix', {
		t('fix: '),
		i(1, 'short description of the fix'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'detailed explanation of the fix'),
		t({ '', '', 'FOOTER:', '' }),
		i(3, 'e.g., Closes #123, BREAKING CHANGE: description'),
	}),

	-- chore: Maintenance tasks
	s('chore', {
		t('chore: '),
		i(1, 'short description of the task'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'optional additional context'),
	}),

	-- docs: Documentation changes
	s('docs', {
		t('docs: '),
		i(1, 'short description of the documentation update'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'optional additional context'),
	}),

	-- style: Formatting changes (no code changes)
	s('style', {
		t('style: '),
		i(1, 'short description of the styling update'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'optional additional context'),
	}),

	-- refactor: Code refactoring
	s('refactor', {
		t('refactor: '),
		i(1, 'short description of the refactoring'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'optional additional context'),
		t({ '', '', 'FOOTER:', '' }),
		i(3, 'e.g., BREAKING CHANGE: description'),
	}),

	-- perf: Performance improvements
	s('perf', {
		t('perf: '),
		i(1, 'short description of the performance improvement'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'detailed explanation of the improvement'),
		t({ '', '', 'FOOTER:', '' }),
		i(3, 'e.g., Closes #456, BREAKING CHANGE: description'),
	}),

	-- test: Adding or updating tests
	s('test', {
		t('test: '),
		i(1, 'short description of the tests'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'optional additional context'),
	}),

	-- ci: Continuous integration changes
	s('ci', {
		t('ci: '),
		i(1, 'short description of the CI update'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'optional additional context'),
	}),

	-- build: Build system or dependency changes
	s('build', {
		t('build: '),
		i(1, 'short description of the build system change'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'optional additional context'),
	}),

	-- BREAKING CHANGE: Explicitly state a breaking change
	s('breaking', {
		t('BREAKING CHANGE: '),
		i(1, 'short description of the breaking change'),
		t({ '', '', 'BODY:', '' }),
		i(2, 'detailed explanation of the breaking change'),
		t({ '', '', 'FOOTER:', '' }),
		i(3, 'migration or follow-up notes'),
	}),
}
