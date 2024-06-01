dofile 'error.lua'

-- Determine if given file exists.
function file_exists(name)
	local file = io.open(name, 'r')
	if file == nil then return false end
	file:close()
	return true
end

-- Determine which in a list of files exists.
function file_fallback(names)
	for _, name in ipairs(names) do
		if file_exists(name) then return name end
	end
end

-- Read specified file.
function file_read(path)
	local file = io.open(path, 'rb')
	if file == nil then return error_new{ 'Failed to open file for reading:', path } end

	local data = file:read('*a')
	if data == nil then return error_new{ 'Failed to read from file:', path } end

	file:close()
	return data
end

-- Write specified file.
function file_write(path, data)
	local file = io.open(path, 'wb')
	if file == nil then return error_new{ 'Failed to open file for writing:', path } end
	
	file:write(data)
	file:close()
end

-- Delete specified file.
function file_delete(path)
	local ok, err = os.remove(path)
	if err ~= nil then return error_new{ 'Error deleting file:', path, 'Error code: ' .. err } end
end

-- Copy specified file.
function file_copy(from, to)
	local data = file_read(from)
	if errored(data) then return error_new({
		'Failed to copy file:',
		'Source: ' .. from,
		'Destination: ' .. to
	}, data) end

	file_write(to, data)
end

