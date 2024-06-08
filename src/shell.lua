dofile 'error.lua'

-- Determine if given command exists.
function shell_exists(name)
	local okay, reason, code = os.execute(name)
	return reason == 'exit' and code ~= 1
end


-- Determine which in a list of commands exists.
function shell_fallback(names)
	for _, name in ipairs(names) do
		if shell_exists(name) then return name end
	end
end

-- Sanitize a shell argument.
function shell_sanitize_arg(arg)
	if arg:find(' ') and not arg:find('"') then
		return '"' .. arg .. '"'
	end

	return arg
end

-- Sanitize shell arguments.
function shell_sanitize_args(...)
	local args = {}

	for i, subarg in ipairs{...} do
		args[i] = shell_sanitize_arg(subarg)
	end

	local command = table.concat(args, ' ')
	if app.fs.pathSeparator == '\\' then command = '"' .. command .. '"' end
	return command
end

-- Execute a shell command with arguments.
function shell_execute(...)
	local command = shell_sanitize_args(...)
	local okay, reason, code = os.execute(command)

	if reason == 'exit' then
		if code ~= 0 then return error_new{ 'Exit status ' .. code .. ' while executing command:', command } end
	elseif reason == 'signal' then
		return error_new{ 'Termination signal ' .. code .. ' while executing command:', command }
	end
end

-- Execute given command and get stdout.
function shell_stdout(...)
	local command = shell_sanitize_args(...)
	local file = io.popen(command, 'r')
	if file == nil then return error_new{ 'Failed to execute command:', command } end

	local string = file:read('*a')
	if string == nil then return error_new{ 'Failed to read stdout of command:', command } end
	
	file:close()
	return string
end
