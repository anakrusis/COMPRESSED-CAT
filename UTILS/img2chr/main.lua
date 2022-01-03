function love.load()
	scrollX = 0; scrollY = 0;
	quantisedBitmap = {}
end

function love.update(dt)
	if love.keyboard.isDown("up") then
		scrollY = scrollY - 4;
	end
	if love.keyboard.isDown("down") then
		scrollY = scrollY + 4;
	end
end

function quantiseImage()
	-- output table init
	for i = 0, imageData:getWidth() do
		quantisedBitmap[i] = {}
	end
	
	-- FIRST PASS: index all the colors into a table.
	-- each distinct color val it finds will be a key in the table with value "true"
	local colors = {}
	local colorcount = 0;
	
	for x = 0, imageData:getWidth() - 1 do
		for y = 0, imageData:getHeight() - 1 do
			
			local r,g,b,a  = imageData:getPixel(x,y);
			local pixelval = value(r,g,b,a);
			
			if not colors[pixelval] then
				colors[pixelval] = true;
				colorcount = colorcount + 1;
			end
		end
	end
	-- table with all the keys of colors (note: indexes start from one because of sort functionality)
	local colorkeys = {}; local n = 1;
	for k,v in pairs(colors) do colorkeys[n] = k; n = n + 1; end
	table.sort(colorkeys);
	
	-- now all the colors are flattened down to values between 0 and 3 
	for i = 1, colorcount do
		local averagecolor = math.floor(4 * ((i - 1) / colorcount))
		colors[ colorkeys[i] ] = averagecolor;
		print(averagecolor)
	end
	
	-- SECOND PASS: make a new table with the flattened colors
	for x = 0, imageData:getWidth() - 1 do
		for y = 0, imageData:getHeight() - 1 do
		
			local r,g,b,a  = imageData:getPixel(x,y);
			local pixelval = value(r,g,b,a);
			local newcolor = colors[pixelval];
			
			quantisedBitmap[x][y] = newcolor;
		end
	end
end

function love.filedropped(file)
	imageData = love.image.newImageData(file);
	image = love.graphics.newImage(imageData);
	
	quantiseImage();
end

function love.draw()
	love.graphics.push()
	love.graphics.translate(-scrollX,-scrollY);
	love.graphics.scale(2)
	--if (image) then love.graphics.draw(image,0,0); end
	
	if quantisedBitmap[0] then
		for x = 0, imageData:getWidth() - 1 do
			for y = 0, imageData:getHeight() - 1 do
				
				local p = quantisedBitmap[x][y];
				love.graphics.setColor(p/3,p/3,p/3)
				love.graphics.rectangle("fill",x,y,1,1)
			end
		end
	end
	love.graphics.pop()
end

function value(r,g,b,a)
	return (( r + g + b ) / 3)
end