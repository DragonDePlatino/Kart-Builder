
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
		local cel, flipped = cel_find(group, layername, 1, angle, true)
		if cel ~= nil then return cel, flipped end
	end

	if angle > 5 then
		-- Try to find flipped cel from this layer.
		local cel, flipped = cel_find(group, layername, frame, 10 - angle)
		if cel ~= nil then return cel, true end
	end

	-- Try to find cel on fallback layer.
	local fallbackname = layer_fallback(group, layername)
	if fallbackname == nil then return nil, true end
	return cel_find(group, fallbackname, frame, angle)
end
