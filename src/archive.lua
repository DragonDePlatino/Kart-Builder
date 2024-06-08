dofile 'shell.lua'
dofile 'file.lua'

-- Paths checked for 7-Zip.
local archive_binaries = {
	'C:\\Program Files\\7-Zip\\7z.exe',
	'C:\\Program Files(x86)\\7-Zip\\7z.exe'
}

-- Commands checked.
local archive_shells = {
	'7z',
	'7za'
}

-- Path to 7-Zip binary.
local archive_path = nil

-- Initialize archive path.
function archive_init()
	if archive_path ~= nil then return end

	-- Check if 7-Zip binary exists.
	archive_path = file_fallback(archive_binaries)

	if archive_path == nil then
		-- Check if 7-Zip shell command exists.
		archive_path = shell_fallback(archive_shells)
	end

	if archive_path == nil then
		return error_new{
			'Failed to find 7-Zip installation. Please install 7-Zip to one of the following locations:',
			table_map(archive_binaries, function(path) return ' * ' .. path end),
			'Or make one of the following commands available in your shell:',
			table_map(archive_shells, function(path) return ' * ' .. path end)
		}
	end
end

-- List files in an archive.
function archive_list(path)
	-- Run archiver and get listing.
	local output = shell_stdout(archive_path, 'l', path)
	if errored(output) then return error_new({ 'Failed to list files in archive:', path }, output) end
	
	-- Cut down listing to just filenames.
	local files = {}
	local lines = string_split(output, '\r\n')
	for _, line in ipairs(lines) do
		local match = line:match('%d+-%d+-%d+ +%d+:%d+:%d+ +%S+ +%d+ +%d+ +([%S]+)$')
		if match == nil then goto continue end
		files[#files + 1] = match
		::continue::
	end

	return files
end

-- Read specified files from archive.
function archive_read(path, names)
	local temp_path = path_temp('extract')
	app.fs.makeAllDirectories(temp_path)

	-- Write all filenames to listing.
	local names_path = app.fs.joinPath(temp_path, 'names')
	local result = file_write(names_path, table.concat(names, '\n'))
	if errored(result) then return error_new({ 'Failed to write filename listing for archive:', path }, result) end

	local result = shell_execute(archive_path, 'x', path, '-o' .. shell_sanitize_arg(temp_path), '@' .. shell_sanitize_arg(names_path), '-y')
	if errored(result) then return error_new({ 'Error reading files from archive:', path }, result) end

	local entries = {}
	for _, name in ipairs(names) do
		local fullpath = app.fs.joinPath(temp_path, name)
		local data = file_read(fullpath)

		if errored(data) then return error_new({ 'Error reading entry in archive:', name }, data) end
		entries[#entries + 1] = { name = name, data = data }
	end

	return entries
end

-- Create archive from list of entries.
function archive_create(path, entries)
	local temp_path = path_temp('output')
	app.fs.makeAllDirectories(temp_path)

	-- Delete existing entries.
	if file_exists(path) then
		local result = shell_execute(archive_path, 'd', path, '*')
		if errored(result) then return error_new({ 'Error deleting existing entries in archive:', path }, result) end
	end

	local names = {}
	for i, entry in ipairs(entries) do
		-- Output temporary files with ordered names.
		local out_path = app.fs.joinPath(temp_path, string.format('%03d', i))
		
		if entry.data ~= nil then
			-- Write file to location.
			local result = file_write(out_path, entry.data)
			if errored(result) then return error_new({ 'Failed to write entry in archive:', path }, result) end
		elseif entry.path ~= nil then
			-- Copy file to location.
			local result = file_copy(entry.path, out_path)
			if errored(result) then return error_new({ 'Failed to copy entry in archive:', path }, result) end
		else
			-- Write empty tag to location.
			local result = file_write(out_path, '')
			if errored(result) then return error_new({ 'Failed to write tag in archive:', path }, result) end
		end

		names[#names + 1] = out_path
	end

	-- Write all filenames to listing.
	local names_path = app.fs.joinPath(temp_path, 'names')
	local result = file_write(names_path, table.concat(names, '\n'))
	if errored(result) then return error_new({ 'Failed to write filename listing for archive:', path }, result) end

	-- Add all files to archive.
	local result = shell_execute(archive_path, 'a', '-tzip', path, '@' .. shell_sanitize_arg(names_path))
	if errored(result) then return error_new({ 'Error adding files to archive:', path }, result) end

	-- Write all renames to listing.
	local renames = {}
	for i, entry in ipairs(entries) do
		renames[#renames + 1] = string.format('%03d', i)
		renames[#renames + 1] = entry.name
	end

	-- Write all renames to listing.
	local renames_path = app.fs.joinPath(temp_path, 'renames')
	local result = file_write(renames_path, table.concat(renames, '\n'))
	if errored(result) then return error_new({ 'Failed to write archive rename listing for archive:', path }, result) end

	local result = shell_execute(archive_path, 'rn', path, '@' .. shell_sanitize_arg(renames_path))
	if errored(result) then return error_new({ 'Error renaming files in archive:', path }, result) end
end
