dofile 'color.lua'
dofile 'plugin.lua'
dofile 'properties.lua'

-- Update palette preview.
function palette_preview(reset)
	local data = plugin_properties_unpack(app.sprite, properties_skin, true)
	local startcolor = data.startcolor
	local prefcolor = data.prefcolor

	-- Keep previewing last color for default.
	if prefcolor == 'default' then return end

	-- Clean up after changing startcolor
	if reset then
		for i = 0, 255 do
			local color = colors_global[i + 1]
			app.sprite.palettes[1]:setColor(i, color)
		end
	end

	-- Fetch colors of palette.
	local indexes = colors_skin[prefcolor]
	if indexes == nil then error('Invalid palette to preview: ' .. prefcolor) end

	-- Reset current previewed colors.
	for i = 0, 15 do
		local color = colors_global[indexes[i + 1] + 1]
		app.sprite.palettes[1]:setColor(startcolor + i, color)
	end
end
