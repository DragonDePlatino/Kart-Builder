dofile 'table.lua'

plugin_version = '1.1.3'
plugin_key = 'dragondeplatino/kart-builder'

-- Unpack plugin properties from object into a table.
function plugin_properties_unpack(object, properties, keep_arrays)
	local out = {}

	for _, property in ipairs(properties) do
		local value = object.properties(plugin_key)[property.id]
		local fallback = table_copy(property.default)
		if type(value) ~= type(fallback) then
			object.properties(plugin_key)[property.id] = fallback
			value = fallback
		end

		if keep_arrays or property.count == nil then
			out[property.id] = value
		else
			for i = 1, property.count do
				out[property.id .. i] = value[i]
			end
		end
	end

	return out
end

-- Pack a table into plugin properties.
function plugin_properties_pack(object, properties, t)
	for _, property in ipairs(properties) do
		local value = t[property.id]
		local fallback = table_copy(property.default)
		if type(value) ~= type(fallback) then value = fallback end

		if property.count == nil then
			object.properties(plugin_key)[property.id] = value
		else
			out[property.id] = {}
			for i = 1, property.count do
				out[property.id][i] = value[property.id .. i]
			end
		end
	end
end
