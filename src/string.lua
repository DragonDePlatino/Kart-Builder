
-- Check if string starts with given string.
function string_starts(string, start)
	return string:sub(1, start:len()) == start
end

-- Split a string on a separator and return list.
function string_split(string, sep)
	local tokens = {}

	for token in string:gmatch('([^' .. sep .. ']+)') do
		tokens[#tokens + 1] = token
	end

	return tokens
end

-- Match all values in string matching pattern.
function string_match(string, pattern)
	local tokens = {}

	for token in string:gmatch(pattern) do
		tokens[#tokens + 1] = token
	end

	return table.unpack(tokens)
end

-- Parse a list of points from a string.
function string_points(string)
	local points = {}

	for _, token in ipairs(string_split(string, '%s')) do
		local x, y = string_match(token, '[+-]?[%d]+')
		points[#points + 1] = Point(tonumber(x or 0), tonumber(y or 0))
	end

	return points
end
