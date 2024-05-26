
-- Normalize a path to use OS-property separators.
function path_normalize(path)
	return path:gsub('[/\\]', app.fs.pathSeparator)
end
