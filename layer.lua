
-- Base fallbacks for layers.
local base_fallback = {
	STIL = 'STIN',
	STIR = 'STIN',
	STGL = 'STIN',
	STGR = 'STIN',
	STLL = 'STGL',
	STLR = 'STGR',
	
	SLWN = 'STIN',
	SLWL = 'STIL',
	SLWR = 'STIR',
	SLGL = 'STGL',
	SLGR = 'STGR',
	SLLL = 'STLL',
	SLLR = 'STLR',
	
	FSTN = 'SLWN',
	FSTL = 'SLWL',
	FSTR = 'SLWR',
	FSGL = 'SLGL',
	FSGR = 'SLGR',
	FSLL = 'SLLL',
	FSLR = 'SLLR',

	DRLN = 'FSGR',
	DRLO = 'DRLN',
	DRLI = 'DRLN',
	DRRN = 'FSGL',
	DRRO = 'DRRN',
	DRRI = 'DRRN',

	SPIN = 'FSTN'
}

-- Fallback overrides for kart layer.
local kart_fallback = {
	SLWL = 'SLWN',
	SLWR = 'SLWN',
	SLGL = 'SLWN',
	SLGR = 'SLWN',
	SLLL = 'SLWN',
	SLLR = 'SLWN',

	FSTL = 'SLWL',
	FSTR = 'SLWR',
	FSLL = 'FSTN',
	FSLR = 'FSTN'
}

-- Resolve a fallback for a given group layer combination.
function layer_fallback(group, layername)
	if group.name == 'kart' then
		return kart_fallback[layername] or base_fallback[layername]
	else
		return base_fallback[layername]
	end
end

-- Find layer in given group.
function layer_find(group, layername)
	for i, layer in ipairs(group.layers) do
		if layer.name == layername and layer.isImage then return layer end
	end

	return nil
end
