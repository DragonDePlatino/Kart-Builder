
-- Perform a shallow copy of value.
function table_copy(t)
	if type(t) ~= 'table' then return t end
	local out = {}

	for key, value in pairs(t) do
		out[key] = value
	end

	return out
end

-- Find a value in table.
function table_find(t, callback)
	for _, value in pairs(t) do
		if callback(value) then return value end
	end
end

-- Get list of keys in a table.
function table_keys(t)
	local keys = {}

	for key, _ in pairs(t) do
		keys[#keys + 1] = key
	end

	table.sort(keys)
	return keys
end

-- Get list of values in a table.
function table_values(t)
	local values = {}

	for _, value in pairs(t) do
		values[#values + 1] = value
	end

	table.sort(values)
	return values
end

-- Get number of entries in table.
function table_length(t)
	local count = 0
	for _ in pairs(t) do count = count + 1 end
	return count
end

-- Remove a value from a table.
function table_remove_value(t, value)
	for i, v in pairs(t) do
		if v == value then
			table.remove(t, i)
			return
		end
	end
end

-- Map each value of a table.
function table_map(t, callback)
	local out = {}
	
	for i, value in ipairs(t) do
		out[i] = callback(value)
	end

	return out
end

-- Concatenate two or more tables together into a new one.
function table_concat(...)
	local out = {}

	for i, subtable in ipairs{...} do
		for j, subvalue in ipairs(subtable) do
			out[#out + 1] = subvalue
		end
	end

	return out
end

-- Filter an array to the unique values.
function table_unique(t)
	local seen = {}
	local out = {}

	for _, value in ipairs(t) do
		if (not seen[value]) then
			out[#out + 1] = value
			seen[value] = true
		end
	end

	return out
end
