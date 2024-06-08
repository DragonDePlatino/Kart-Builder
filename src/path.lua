
-- Get a temporary path.
function path_temp(directory)
	return app.fs.joinPath(app.fs.tempPath, 'Aseprite', 'Kart Builder', directory)
end

-- Normalize a path to use OS-property separators.
function path_normalize(path)
	return path:gsub('[/\\]', app.fs.pathSeparator)
end
