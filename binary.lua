
-- Write a 16-bit value to table at position.
function binary_u16(out, n, offset)
	out[offset    ] = (n     ) & 0xFF
	out[offset + 1] = (n >> 8) & 0xFF
end

-- Write a 32-bit value to table at position.
function binary_u32(out, n, offset)
	out[offset    ] = (n      ) & 0xFF
	out[offset + 1] = (n >>  8) & 0xFF
	out[offset + 2] = (n >> 16) & 0xFF
	out[offset + 3] = (n >> 24) & 0xFF
end
