dofile 'error.lua'

-- Split a cel name into individual parts.
function cel_split(name)
	local layer, framename, anglename  = name:match('(%u%u%u%u)(%u)(%d)')
	if layer == nil then return error_new('Invalid cel name: ' .. name) end

	local frame = framename:byte() - string.byte('@')
	if frame < 1 or frame > 4 then return error_new('Frame out of range: ' .. framename .. ' (expected 1 ~ 4, got ' .. frame .. ')') end

	local angle = tonumber(anglename)
	if angle < 1 or angle > 8 then return error_new('Angle out of range: ' .. anglename .. ' (expected 1 ~ 8, got ' .. angle .. ')') end

	return layer, frame, angle
end

-- Resolve a cel.
function cel_find(group, layername, frame, angle, exact)
	local layer = layer_find(group, layername)
	if layer == nil then
		-- Bail if we requested an exact frame.
		if exact then return nil, false end

		-- Layer does not exist, find fallback layer.
		local fallbackname = layer_fallback(group, layername)
		if fallbackname == nil then return nil, true end
		return cel_find(group, fallbackname, frame, angle)
	end

	-- Extract requested cel without fallbacks.
	local cel = layer:cel(angle + (8 * (frame - 1)) % #app.sprite.frames)
	if cel ~= nil then return cel, false end
	if exact then return nil, false end

	if frame > 1 then
		-- Try to fallback on first frame.
		local cel, flip = cel_find(group, layername, 1, angle, true)
		if cel ~= nil then return cel, flip end
	end

	if angle > 5 then
		-- Try to find flipped cel from this layer.
		local cel, flip = cel_find(group, layername, frame, 10 - angle)
		if cel ~= nil then return cel, true end
	end

	-- Try to find cel on fallback layer.
	local fallbackname = layer_fallback(group, layername)
	if fallbackname == nil then return nil, true end
	return cel_find(group, fallbackname, frame, angle)
end
