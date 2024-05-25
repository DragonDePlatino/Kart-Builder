dofile 'shell.lua'
dofile 'file.lua'

-- Path to output temporary files.
local temp_path = app.fs.joinPath(app.fs.tempPath, 'Aseprite', 'Kart Builder')

-- Check if 7-Aip binary exists.
local archiver_path = file_fallback({
	'C:\\Program Files\\7-Zip\\7z.exe',
	'C:\\Program Files(x86)\\7-Zip\\7z.exe'
})

if archiver_path == nil then
	-- Check if 7-Zip shell command exists.
	archiver_path = shell_fallback({
		'7z',
		'7za'
	})
end

if archiver_path == nil then
	error('Failed to find 7-Zip installation. Please install 7-Zip for pk3 packaging support.')
end

-- Create archive from list of entries.
function archive_create(path, entries)
	local temp_path = app.fs.joinPath(app.fs.tempPath, 'Aseprite', 'Kart Builder')
	app.fs.makeAllDirectories(temp_path)

	-- Delete existing entries.
	if file_exists(path) then
		shell_execute(archiver_path, 'd', path, '*')
	end

	local names = {}
	for i, entry in ipairs(entries) do
		-- Output temporary files with ordered names.
		local out_path = app.fs.joinPath(temp_path, string.format('%03d', i))
		
		if entry.data ~= nil then
			-- Write file to location.
			file_write(out_path, entry.data)
		elseif entry.path ~= nil then
			-- Copy file to location.
			file_copy(entry.path, out_path)
		else
			-- Write empty tag to location.
			file_write(out_path, '')
		end

		names[#names + 1] = out_path
	end

	-- Write all filenames to listing.
	local names_path = app.fs.joinPath(temp_path, 'names')
	file_write(names_path, table.concat(names, '\n'))

	-- Add all files to archive.
	shell_execute(archiver_path, 'a', '-tzip', path, '@' .. shell_sanitize(names_path))

	-- Write all renames to listing.
	local renames = {}
	for i, entry in ipairs(entries) do
		renames[#renames + 1] = string.format('%03d', i)
		renames[#renames + 1] = entry.name
	end

	-- Write all renames to listing.
	local renames_path = app.fs.joinPath(temp_path, 'renames')
	file_write(renames_path, table.concat(renames, '\n'))
	shell_execute(archiver_path, 'rn', path, '@' .. shell_sanitize(renames_path))
end
