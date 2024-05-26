
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
