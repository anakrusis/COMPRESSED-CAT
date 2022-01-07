-- table for performing tile operations and comparisons
Tile = {
	-- this is not actually where the tile is to be found in VRAM/within the tileset!
	-- it is really for getting the data from the image using these coordinates
	x = 0, y = 0,
	-- just a 1 dimensional stream of pixel values between 0 and 3
	data = {},
	-- means this tile is the same as another one, and all its references can be absorbed
	markedForConsolidation = false
}
function Tile:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	
	o.data = {};
	return o
end

function Tile:export()
	local out = {};
	for i = 0, 15 do
		local byteout = 0x00;
		for j = 7, 0, -1 do
			-- pixel index ignores the parity of the byte
			local pixelindex = 1 + ( 4 * bitwise.band(i, 0xfe) ) + ( 7 - j );
			local color;
			-- even bytes: low bits of color value
			if i % 2 == 0 then
				color = bitwise.band(self.data[pixelindex], 0x01);
			-- odd bytes: high bits ''
			else
				color = bitwise.band(self.data[pixelindex], 0x02);
			end
			-- This is so the bitmask can take a bit from wherever
			if color ~= 0x00 then color = 0xff end
			
			local bitmask = math.pow(2,j);
			byteout = byteout + bitwise.band(color, bitmask);
		end
		table.insert(out, byteout);
	end
	return out;
end

function Tile:putData()
	local sx = self.x * 8; local sy = self.y * 8;
	for y = 0, 7 do
		for x = 0, 7 do
			
			local cx = sx + x; local cy = sy + y;
			if not quantisedBitmap[cx] then
				table.insert(self.data, 0);
			elseif not quantisedBitmap[cx][cy] then
				table.insert(self.data, 0);
			else
				local val = quantisedBitmap[cx][cy];
				table.insert(self.data, val);
			end
		end
	end
end

function Tile:isEqual(othertile)
	for i = 1, 64 do
		if self.data[i] ~= othertile.data[i] then return false end
	end
	return true
end