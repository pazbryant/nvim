---@diagnostic disable: undefined-global

return {
	-- feat: A new feature
	-- Conventional Commit Snippets
	-- Feature
	s('feat', {
		t('feat('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Fix
	s('fix', {
		t('fix('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Chore
	s('chore', {
		t('chore('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Documentation
	s('docs', {
		t('docs('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Style
	s('style', {
		t('style('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Refactor
	s('refactor', {
		t('refactor('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Test
	s('test', {
		t('test('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Performance
	s('perf', {
		t('perf('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Continuous Integration
	s('ci', {
		t('ci('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	s('breaking', {
		-- Add line breaks before the BREAKING CHANGE tag
		t({ '', '', 'BREAKING CHANGE: ' }),
		-- Placeholder for the breaking change description
		i(1, 'description of the breaking change'),
	}),
}
