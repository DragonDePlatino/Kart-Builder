dofile 'archive.lua'
dofile 'binary.lua'
dofile 'cel.lua'
dofile 'dialog.lua'
dofile 'layer.lua'
dofile 'rival.lua'
dofile 'palette.lua'
dofile 'path.lua'
dofile 'properties.lua'
dofile 'string.lua'
dofile 'table.lua'
dofile 'image.lua'

-- Skin images to output, and dither for each frame.
local skin_sprites = {
	{ name = 'STIN', frames = { 0, 1 } },
	{ name = 'STIL', frames = { 0, 1 } },
	{ name = 'STIR', frames = { 0, 1 } },
	{ name = 'STGL', frames = { 0, 1 } },
	{ name = 'STGR', frames = { 0, 1 } },
	{ name = 'STLL', frames = { 0, 1 } },
	{ name = 'STLR', frames = { 0, 1 } },

	{ name = 'SLWN', frames = { 2, 0 } },
	{ name = 'SLWL', frames = { 2, 0 } },
	{ name = 'SLWR', frames = { 2, 0 } },
	{ name = 'SLGL', frames = { 2, 0 } },
	{ name = 'SLGR', frames = { 2, 0 } },
	{ name = 'SLLL', frames = { 2, 0 } },
	{ name = 'SLLR', frames = { 2, 0 } },

	{ name = 'FSTN', frames = { 0, 0 } },
	{ name = 'FSTL', frames = { 0, 0 } },
	{ name = 'FSTR', frames = { 0, 0 } },
	{ name = 'FSGL', frames = { 0, 0 } },
	{ name = 'FSGR', frames = { 0, 0 } },
	{ name = 'FSLL', frames = { 0, 0 } },
	{ name = 'FSLR', frames = { 0, 0 } },

	{ name = 'DRLN', frames = { 0, 0 } },
	{ name = 'DRLO', frames = { 2, 0 } },
	{ name = 'DRLI', frames = { 3, 0, 4, 0 } },
	{ name = 'DRRN', frames = { 0, 0 } },
	{ name = 'DRRO', frames = { 2, 0 } },
	{ name = 'DRRI', frames = { 4, 0, 3, 0 } },

	{ name = 'SPIN', frames = { 0 } },
	{ name = 'DEAD', frames = {} },
	{ name = 'SIGN', frames = {} },
	{ name = 'SIGL', frames = {} },
	{ name = 'SSIG', frames = {} },
	{ name = 'XTRA', frames = {} },
	{ name = 'TALK', frames = {} }
}

-- Skin autofill rules.
local skin_autofills = {
	STIL = { exact = true,	rules = {	'',			'',			'',			'',			'STINA5'									 } },
	STIR = { exact = true,	rules = {	'',			'',			'',			'',			'STINA5'									 } },
	STGL = { exact = false,	rules = {	'STINA8',	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STIRA5',	'STINA6',	'STINA7' } },
	STGR = { exact = false,	rules = {	'STINA2',	'STINA3',	'STINA4',	'STILA5',	'STINA6',	'STINA7',	'STINA8',	'STINA1' } },
	STLL = { exact = false,	rules = {	'STINA7',	'STINA8',	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STINA5',	'STINA6' } },
	STLR = { exact = false,	rules = {	'STINA3',	'STINA4',	'STINA5',	'STINA6',	'STINA7',	'STINA8',	'STINA1',	'STINA2' } },

	SLWN = { exact = false,	rules = {	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STINA5',	'STIRA6',	'STINA7',	'STINA8' } },
	SLWL = { exact = false,	rules = {	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STILA5',	'STIRA6',	'STINA7',	'STINA8' } },
	SLWR = { exact = false,	rules = {	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STIRA5',	'STIRA6',	'STINA7',	'STINA8' } },
	SLGL = { exact = false,	rules = {	'STINA8',	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STIRA5',	'STINA6',	'STINA7' } },
	SLGR = { exact = false,	rules = {	'STINA2',	'STINA3',	'STINA4',	'STILA5',	'STINA6',	'STINA7',	'STINA8',	'STINA1' } },
	SLLL = { exact = false,	rules = {	'STINA7',	'STINA8',	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STINA5',	'STINA6' } },
	SLLR = { exact = false,	rules = {	'STINA3',	'STINA4',	'STINA5',	'STINA6',	'STINA7',	'STINA8',	'STINA1',	'STINA2' } },

	FSTN = { exact = false,	rules = {	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STINA5',	'STIRA6',	'STINA7',	'STINA8' } },
	FSTL = { exact = false,	rules = {	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STILA5',	'STIRA6',	'STINA7',	'STINA8' } },
	FSTR = { exact = false,	rules = {	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STIRA5',	'STIRA6',	'STINA7',	'STINA8' } },
	FSGL = { exact = false,	rules = {	'STINA8',	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STIRA5',	'STINA6',	'STINA7' } },
	FSGR = { exact = false,	rules = {	'STINA2',	'STINA3',	'STINA4',	'STILA5',	'STINA6',	'STINA7',	'STINA8',	'STINA1' } },
	FSLL = { exact = false,	rules = {	'STINA7',	'STINA8',	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STINA5',	'STINA6' } },
	FSLR = { exact = false,	rules = {	'STINA3',	'STINA4',	'STINA5',	'STINA6',	'STINA7',	'STINA8',	'STINA1',	'STINA2' } },

	DRLN = { exact = false,	rules = {	'STINA2',	'STINA3',	'STINA4',	'STILA5',	'STINA6',	'STINA7',	'STINA8',	'STINA1' } },
	DRLO = { exact = false,	rules = {	'STINA2',	'STINA3',	'STINA4',	'STILA5',	'STINA6',	'STINA7',	'STINA8',	'STINA1' } },
	DRLI = { exact = false,	rules = {	'STINA2',	'STINA3',	'STINA4',	'STILA5',	'STINA6',	'STINA7',	'STINA8',	'STINA1' } },
	DRRN = { exact = false,	rules = {	'STINA8',	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STIRA5',	'STINA6',	'STINA7' } },
	DRRO = { exact = false,	rules = {	'STINA8',	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STIRA5',	'STINA6',	'STINA7' } },
	DRRI = { exact = false,	rules = {	'STINA8',	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STIRA5',	'STINA6',	'STINA7' } },

	SPIN = { exact = true,	rules = {	'STINA1',	'STINA2',	'STINA3',	'STINA4',	'STINA5',	'STINA6',	'STINA7',	'STINA8' } }
}

-- List of skin buttons.
local skin_buttons = {
	{
		type = 'button',
		id = 'export',
		text = 'Export',
		enabled = false
	},
	{
		type = 'button',
		id = 'cancel',
		text = 'Cancel'
	}
}

-- Layers that have their final output cropped.
local layer_crop = {
	XTRA = true
}

-- Parse contents of a skin file into a table.
function skin_table(text)
	local output = {}

	for _, line in ipairs(string_split(text, '\r\n')) do
		local key, value = line:match('^(%S+)%s*=%s*(%S+)$')
		if key == nil then goto continue end

		local number = tonumber(value)
		if number ~= nil then
			value = number
		elseif value:match(',') then
			value = string_split(value, ',')
		end

		output[key] = value
		::continue::
	end

	return output
end

-- Get list of skins in a list of archives.
function skin_archive_tables(paths)
	for _, path in ipairs(paths) do
		local files = archive_list(path)
		if errored(files) then return dialog_error({ 'Error listing skins in archive:', path }, list) end

		local skin_paths = {}
		for _, file in ipairs(files) do
			local match = file:match('S_SKIN$') or file:match('S_SKIN%.%S+$')
			if match ~= nil then skin_paths[#skin_paths + 1] = file end
		end

		local entries = archive_read(path, skin_paths)
		if errored(entries) then return error_new({ 'Error reading entries from skin archive:', path }, entries) end

		for _, entry in ipairs(entries) do
			entry.data = skin_table(entry.data)
		end

		return entries
	end
end

-- Open dialog for saving skin.
function skin_dialog()
	-- Extract properties from current sprite and open dialog for editing.
	local dialog = Dialog({ title = 'Export Kart' })
	local save_button = skin_buttons[0]
	local data = dialog_properties(dialog, properties_skin, skin_buttons, app.sprite)
	if not data.export then return end

	return skin_save(data.path, properties_skin)
end

-- Write set of skin properties to a key=value string.
function skin_string(object, properties)
	local data = plugin_properties_unpack(object, properties, true)
	local out = {}

	for _, property in ipairs(properties) do
		local value = data[property.id]

		if property.write then
			value = property.write(value)
		end
		
		local string = tostring(value)
		local message = 'Skin property "' .. property.id .. '" was invalid: ' .. string

		if property.validate then
			local error = property.validate(value)
			if error ~= nil then return error_new({ message, error }) end
		end

		if string:find(' ') then
			return error_new({ message, 'Properties cannot contain spaces.' })
		end

		if value == nil or value == '' or value == false then goto continue end
		out[#out + 1] = property.id .. ' = ' .. string
		::continue::
	end

	return table.concat(out, '\n')
end

-- Export skin archive to destination.
function skin_save(path, properties)
	-- Track array of files to output.
	local entries = {}

	-- Get stack of groups to output.
	local groups = {}
	for _, layer in ipairs(app.sprite.layers) do
		if layer.isGroup then
			groups[#groups + 1] = layer
		end
	end
	table.sort(groups, function (a, b) return a.stackIndex < b.stackIndex end)

	-- Start sound table.
	entries[#entries + 1] = { name = 'DS_START' }

	-- Output sounds.
	local sprite_path = app.fs.filePath(app.sprite.filename)
	for _, property in ipairs(properties_skin) do
		if property.tab ~= 'Sounds' then goto continue end

		local sound_path = app.sprite.properties(plugin_key)[property.id]
		if sound_path == '' or sound_path == nil then goto continue end
		sound_path = path_normalize(sound_path)

		entries[#entries + 1] = {
			name = app.fs.fileTitle(sound_path),
			path = app.fs.joinPath(sprite_path, sound_path)
		}

		::continue::
	end

	-- End sound table.
	entries[#entries + 1] = { name = 'DS_END' }

	-- Get skin properties as a string.
	local data = skin_string(app.sprite, properties)
	if errored(data) then return error_new('Failed to convert skin properties to string.', data) end

	-- Output skin file.
	entries[#entries + 1] = {
		name = 'S_SKIN',
		data = data
	}

	-- Output each image file.
	local image = Image(ImageSpec{ width = app.sprite.width, height = app.sprite.height, colorMode = ColorMode.INDEXED, transparentColor = 1 })
	for _, output in ipairs(skin_sprites) do
		local layername = output.name
		local frames = output.frames

		if frames[1] ~= nil then
			-- Output single frame for each angle.
			for frame, ditherstyle in ipairs(frames) do
				local angles = { 1, 2, 3, 4, 5, 6, 7, 8 }

				-- Prescan for symmetrical output.
				local symmetrical = true
				for g, group in pairs(groups) do
					for _, angle in ipairs({ 6, 7, 8 }) do
						local cel, flip = cel_find(group, layername, frame, angle)
						symmetrical = symmetrical and flip
					end
				end

				if symmetrical then
					angles = { 1, 2, 3, 4, 5 }
				end

				for a, angle in ipairs(angles) do
					local dirty = false
					
					-- Output each layer in stack.
					for g, group in pairs(groups) do
						local cel, flip = cel_find(group, layername, frame, angle)
						if cel ~= nil then
							image_blit(image, cel.image, cel.position, flip)
							dirty = true
						end
					end

					if not dirty then
						-- Fully empty frame, skip to next one.
						goto continue
					end

					-- Apply dithering to final image.
					image_dither(image, ditherstyle)
					local entry = image_entry(image, layername, frame, angle, symmetrical)
					if errored(entry) then return error_new('Error writing angle image entry.', entry) end

					-- Add to list of entries.
					entries[#entries + 1] = entry
					image:clear()
					::continue::
				end
			end
		else
			-- Directionless sprite, prescan for number of frames to output.
			local symmetrical = true
			local framecount = 0
			for g, group in pairs(groups) do
				local layer = layer_find(group, layername)
				if layer == nil then goto continue end
				framecount = math.max(framecount, #layer.cels)
				::continue::
			end

			if framecount == 0 then
				-- No frames provided.
				goto continue
			end

			-- Output each layer in stack.
			for frame = 1, framecount do
				for g, group in pairs(groups) do
					-- Treat different angles as frames for more compact sprite layout.
					local cel, flip = cel_find(group, layername, 1, frame)
					if cel ~= nil then
						image_blit(image, cel.image, cel.position, flip)
					end
				end

				if layer_crop[layername] then
					local bounds = image:shrinkBounds()
					local cropped = Image(ImageSpec{ width=bounds.width, height=bounds.height, colorMode=ColorMode.INDEXED, transparentColor=1 })
					image_blit(cropped, image, Point(), false)

					local entry = image_entry(cropped, layername, frame, 0, false)
					if errored(entry) then return error_new('Error writing cropped image entry.', entry) end 
					entries[#entries + 1] = entry
				else
					local entry = image_entry(image, layername, frame, 0, false)
					if errored(entry) then return error_new('Error writing directionless image entry.', entry) end 
					entries[#entries + 1] = entry
				end

				image:clear()
			end

			::continue::
		end
	end

	-- Output archive of entries.
	return archive_create(path, entries)
end

-- Asymmetrize frames of specified layer(s).
function skin_asymmetrize()

	-- Determine range to run asymmetrize.
	local layers = layer_range()
	if errored(layers) then return dialog_notice(layers.error) end

	for i, layer in ipairs(layers) do

		local log = { 'Asymmetrized layer: '.. layer.name, '' }
		for dest = 6, 8, 1 do
			local source = 10 - dest
			
			local prefix = '    (' .. tostring(dest) .. ') '
			local cel = cel_find(layer.parent, layer.name, 1, source, true)
			if cel == nil then
				log[#log + 1] = prefix .. 'Skipped. Angle was empty: ' .. source
				goto continue
			end

			-- Copy over pixels from other cel to this one.
			local image = Image(ImageSpec{ width = app.sprite.width, height = app.sprite.height, colorMode = ColorMode.INDEXED, transparentColor = 1 })
			local canvas = app.sprite:newCel(layer, dest, image)
			image_blit(canvas.image, cel.image, cel.position, true)

			log[#log + 1] = prefix .. 'Copied: ' .. layer.name .. source
			::continue::
		end

		if #layers == 1 then dialog_notice(table.unpack(log)) end
	end

	if #layers > 1 then dialog_notice('Asymmetrized ' .. #layers .. ' layers.') end
	app.refresh()
end

-- Autofill frames of specified layer.
function skin_autofill()

	-- Determine range to run autofills.
	local dests = layer_range()
	if errored(dests) then return dialog_notice(dests.error) end

	for i, dest in ipairs(dests) do
		local log = { 'Executed autofill rules for layer: '.. dest.name, '' }
		local offsets = string_points(dest.data)
		
		local autofill = skin_autofills[dest.name]
		if autofill == nil then return dialog_notice('No autofill rules available for layer: ' .. dest.name) end
	
		for i, rule in ipairs(autofill.rules) do
			if rule == '' then goto continue end

			local source, frame, angle = cel_split(rule)
			if errored(source) then return error_new('Failed to parse autofill rule: ' .. rule, source) end
			
			local prefix = '    (' .. tostring(i) .. ') '
			local cel, flip = cel_find(dest.parent, source, frame, angle, autofill.exact)
			if cel == nil then
				log[#log + 1] = prefix .. 'Skipped. Cel was empty: ' .. rule
				goto continue
			end
	
			-- Copy over pixels from other cel to this one.
			local offset = offsets[i] or Point(0, 0)
			local image = Image(ImageSpec{ width = app.sprite.width, height = app.sprite.height, colorMode = ColorMode.INDEXED, transparentColor = 1 })
			local canvas = app.sprite:newCel(dest, i, image)
			image_blit(canvas.image, cel.image, Point(cel.position.x + offset.x * (flip and -1 or 1), cel.position.y, offset.y), flip)
			
			log[#log + 1] = prefix .. 'Copied: ' .. rule .. ' (' .. tostring(offset.x) .. ', ' .. tostring(offset.y) .. ')'
			::continue::
		end

		if #dests == 1 then dialog_notice(table.unpack(log)) end
	end

	if #dests > 1 then dialog_notice('Executed autofill rules for ' .. #dests .. ' layers.') end
	app.refresh()
end
