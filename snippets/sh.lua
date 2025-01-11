---@diagnostic disable: undefined-global

return {
	-- instert variable
	s('va', {
		t('"$'),
		i(1),
		t('"'),
		i(2),
	}),

	-- if statement
	s('if', {
		t('if [ '),
		i(1, 'condition'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands'),
		t({ '', 'fi' }),
	}),

	-- "if-else" statement
	s('ifelse', {
		t('if [ '),
		i(1, 'condition'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_true'),
		t({ '', 'else', '\t' }),
		i(3, 'commands_if_false'),
		t({ '', 'fi' }),
	}),

	-- "for" loop
	s('for', {
		t('for '),
		i(1, 'var'),
		t(' in '),
		i(2, 'values'),
		t({ '; do', '\t' }),
		i(3, 'commands'),
		t({ '', 'done' }),
	}),

	-- "while" loop
	s('while', {
		t('while [ '),
		i(1, 'condition'),
		t(' ]; do'),
		t({ '', '\t' }),
		i(2, 'commands'),
		t({ '', 'done' }),
	}),

	-- "case" statement
	s('case', {
		t('case '),
		i(1, 'variable'),
		t(' in'),
		t({ '', '\t' }),
		i(2, 'pattern1'),
		t({ ')', '\t\t' }),
		i(3, 'commands'),
		t({ '', '\t;;', '\t' }),
		i(4, 'pattern2'),
		t({ ')', '\t\t' }),
		i(5, 'commands'),
		t({ '', '\t;;', 'esac' }),
	}),

	-- "function" definition
	s('func', {
		i(1, 'function_name'),
		t('() {'),
		t({ '', '\t' }),
		i(2, 'commands'),
		t({ '', '}' }),
	}),

	-- "while true" loop (common idiom)
	s('whiletrue', {
		t('while true; do'),
		t({ '', '\t' }),
		i(1, 'commands'),
		t({ '', 'done' }),
	}),

	-- "test" command (alternative to [ ])
	s('test', {
		t('test '),
		i(1, 'condition'),
		t({ '', 'if [ $? -eq 0 ]; then', '\t' }),
		i(2, 'commands_if_true'),
		t({ '', 'else', '\t' }),
		i(3, 'commands_if_false'),
		t({ '', 'fi' }),
	}),

	-- "until" loop
	s('until', {
		t('until [ '),
		i(1, 'condition'),
		t(' ]; do'),
		t({ '', '\t' }),
		i(2, 'commands'),
		t({ '', 'done' }),
	}),

	-- Check if a variable is null
	s('isnull', {
		t('if [ -z "$'),
		i(1, 'variable'),
		t('" ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_null'),
		t({ '', 'fi' }),
	}),

	-- Check if a variable is not null
	s('notnull', {
		t('if [ -n "$'),
		i(1, 'variable'),
		t('" ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_not_null'),
		t({ '', 'fi' }),
	}),

	-- Check if a file exists
	s('fileexists', {
		t('if [ -f '),
		i(1, '"file_path"'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_file_exists'),
		t({ '', 'fi' }),
	}),

	-- Check if a directory exists
	s('direxists', {
		t('if [ -d '),
		i(1, '"directory_path"'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_directory_exists'),
		t({ '', 'fi' }),
	}),

	-- Check if a file is readable
	s('filereadable', {
		t('if [ -r '),
		i(1, '"file_path"'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_file_readable'),
		t({ '', 'fi' }),
	}),

	-- Check if a file is writable
	s('filewritable', {
		t('if [ -w '),
		i(1, '"file_path"'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_file_writable'),
		t({ '', 'fi' }),
	}),

	-- Check if two strings are equal
	s('streq', {
		t('if [ "$'),
		i(1, 'string1'),
		t('" = "$'),
		i(2, 'string2'),
		t('" ]; then'),
		t({ '', '\t' }),
		i(3, 'commands_if_equal'),
		t({ '', 'fi' }),
	}),

	-- Check if two strings are not equal
	s('strneq', {
		t('if [ "$'),
		i(1, 'string1'),
		t('" != "$'),
		i(2, 'string2'),
		t('" ]; then'),
		t({ '', '\t' }),
		i(3, 'commands_if_not_equal'),
		t({ '', 'fi' }),
	}),

	-- Check if a variable is a number
	s('isnumber', {
		t('if [ "$'),
		i(1, 'variable'),
		t('" -eq "$'),
		i(2, 'variable'),
		t('" ] 2>/dev/null; then'),
		t({ '', '\t' }),
		i(3, 'commands_if_number'),
		t({ '', 'else', '\t' }),
		i(4, 'commands_if_not_number'),
		t({ '', 'fi' }),
	}),

	-- Print a debug message
	s('debug', {
		t('echo "DEBUG: '),
		i(1, 'message'),
		t('"'),
	}),

	-- Create a temporary file
	s('tmpfile', {
		t('tmpfile=$(mktemp)'),
		t({ '', 'echo "Temporary file created: $tmpfile"', '' }),
		i(1, 'commands'),
		t({ '', 'rm -f "$tmpfile"' }),
	}),

	-- Check if a command exists
	s('commandexists', {
		t('if command -v '),
		i(1, 'command'),
		t(' > /dev/null 2>&1; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_command_exists'),
		t({ '', 'else', '\t' }),
		i(3, 'commands_if_command_not_exists'),
		t({ '', 'fi' }),
	}),
}
