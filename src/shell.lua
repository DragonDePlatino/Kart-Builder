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
function shell_sanitize(arg)
	if arg:find(' ') and not arg:find('"') then
		return '"' .. arg .. '"'
	end

	return arg
end

-- Execute a shell command with argujments.
function shell_execute(...)
	local args = {}
	
	for i, subarg in ipairs{...} do
		args[i] = shell_sanitize(subarg)
	end

	local command = table.concat(args, ' ')
	if app.fs.pathSeparator == '\\' then command = '"' .. command .. '"' end
	local okay, reason, code = os.execute(command)

	if reason == 'exit' then
		if code ~= 0 then return error_new{ 'Exit status ' .. code .. ' while executing command:', command } end
	elseif reason == 'signal' then
		return error_new{ 'Termination signal ' .. code .. ' while executing command:', command }
	end
end
