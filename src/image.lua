dofile 'error.lua'

--- Blit an indexed image to another.
function image_blit(dest, src, position, flipped)
	if flipped then
	local startx = dest.width - src.width - position.x
	local starty = position.y
	for y = 0, src.height - 1 do
		for x = 0, src.width - 1 do
			local color = src:getPixel(src.width - x - 1, y)
			if color ~= 1 then
				dest:drawPixel(startx + x, starty + y, color)
			end
		end
	end
	else
		local startx = position.x
		local starty = position.y
		for y = 0, src.height - 1 do
			for x = 0, src.width - 1 do
				local color = src:getPixel(x, y)
				if color ~= 1 then
					dest:drawPixel(startx + x, starty + y, color)
				end
			end
		end
	end
end

--- Dither an indexed image.
function image_dither(image, style)
	if style == 1 then
		-- Upwards jumble blur.
		for y = 0, image.height - 2 do
			local offset = y % 2 == 1 and 0 or 1
			for x = offset, image.width - 1, 2 do
				local color = image:getPixel(x, y + 1)
				if color ~= 1 then
					image:drawPixel(x, y, color)
				end
			end
		end
	elseif style == 2 then
		-- Upwards checkerboard blur.
		for y = 0, image.height - 4 do
			local offset = y % 2 == 1 and 0 or 1
			for x = offset, image.width - 1,2 do
				local color = image:getPixel(x, y + 3)
				image:drawPixel(x, y, color)
			end
		end

		-- Special case for bottom 3 rows.
		for y = image.height - 3,image.height - 1 do
			local offset = y % 2 == 1 and 0 or 1
			for x = offset, image.width - 1,2 do
				image:drawPixel(x, y, 1)
			end
		end
	elseif style == 3 then
		-- Left horizontal blur.
		for y = 1, image.height - 1,2 do
			for x = 0, image.width - 4 do
				local color = image:getPixel(x + 3, y)
				if color ~= 1 then
					image:drawPixel(x, y, color)
				end
			end
		end
	elseif style == 4 then
		-- Right horizontal blur.
		for y = 1, image.height - 1, 2 do
			for x = image.width - 1, 3, -1 do
				local color = image:getPixel(x - 3, y)
				if color ~= 1 then
					image:drawPixel(x, y, color)
				end
			end
		end
	end
end

-- Get image pixels as a lump.
function image_lump(image)
	local out = {}

	-- Write image dimensions.
	binary_u16(out, image.width, #out + 1)
	binary_u16(out, image.height, #out + 1)

	-- Read offset from sprite.
	local pivot = Point()
	if image.width == app.sprite.width and image.height == app.sprite.height then
		local slice = app.sprite.slices[1]
		if slice == nil then return error_new{ 'Sprite did not have slice.', 'Add a new slice with the slice tool matching your sprite\'s size.' } end

		pivot = slice.pivot
		if pivot == nil then return error_new{ 'Sprite slice did not have pivot.', 'Edit your slice and set a pivot on your racer\'s origin pixel.' } end
	end

	-- Write offset of sprite.
	binary_u16(out, pivot.x, #out + 1)
	binary_u16(out, pivot.y, #out + 1)

	-- Pre-fill column offsets table.
	local offsets = #out + 1
	local posts = #out + 4 * image.width
	for o = offsets, posts do
		out[o] = 0
	end

	-- Process each pixel column into a post.
	for x = 0, image.width - 1 do
		binary_u32(out, posts, offsets)
		offsets = offsets + 4
		local start = 0

		while start < image.height do
			-- Scan top-to-bottom for non-transparent pixels.
			local top = nil
			for y = start, image.height - 1 do
				local pixel = image:getPixel(x, y)
				if pixel ~= 1 then
					top = y
					break
				end
			end

			-- Check for end of column.
			if top == nil then break end

			-- Scan for bottom of this column.
			local bottom = image.height - 1
			for y = top, image.height - 1 do
				local pixel = image:getPixel(x, y)
				if pixel == 1 then
					bottom = y - 1
					break
				end
			end

			-- Output header data.
			out[posts + 1] = top
			out[posts + 2] = bottom - top + 1
			out[posts + 3] = 0x00
			posts = posts + 3

			-- Output all of these pixels.
			for y = top, bottom do
				posts = posts + 1
				out[posts] = image:getPixel(x, y)
			end

			-- Output padding byte.
			posts = posts + 1
			out[posts] = 0x00

			-- Start reading below.
			start = bottom + 1
		end

		-- Output ending marker.
		posts = posts + 1
		out[posts] = 0xFF

		::continue::
	end

	return out
end

-- Get file entry for an image.
function image_entry(image, layername, frame, angle, symmetrical)
	-- Get output filename.
	local suffix = string.char(64 + frame) .. angle
	if angle > 1 and angle < 5 and symmetrical then suffix = suffix .. string.char(64 + frame) .. (10 - angle) end
	local name = layername .. suffix
	
	-- Generate texture lump.
	local lump = image_lump(image)
	if errored(lump) then return error_new({ 'Error writing texture lump: ' .. name }, lump) end
		
	-- Output texture lump.
	local data = string.char(table.unpack(lump))
	return { name = name, data = data }
end
