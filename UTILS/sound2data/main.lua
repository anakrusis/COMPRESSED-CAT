function love.load()
	output_nybbles = {}
	scrollX = 0;
	--soundData = love.sound.newSoundData(
end

function love.filedropped(file)
	output_nybbles = {}
	soundData = love.sound.newSoundData(file)
	
	print("sample rate:  " .. soundData:getSampleRate());
	print("sample count: " .. soundData:getSampleCount()); 
	
	for i = 0, soundData:getSampleCount() - 1 do
		-- currently reading every fourth sample of a 44100hz source --> 11025hz output
		if i % 4 == 0 then
			local cs = soundData:getSample(i); -- range -1 to 1
			cs = ( 1 + cs ) / 2 -- 0 to 1
			cs = math.floor(cs * 16) -- 0 to 15
			--print(cs)
			cs = math.min(15,cs)
			
			table.insert(output_nybbles, cs)
		end
	end
	
	print("output count: " .. #output_nybbles);
	
	makePreview();
	local source = love.audio.newSource(sdn)
	source:play();
	
	local file = io.open("sample.asm", "w")
	output = "sampleData:\ndb "
	
	for i = 1, #output_nybbles, 2 do
		local sum = ( 16 * output_nybbles[i] )
		if output_nybbles[i + 1] then
			sum = sum + output_nybbles[i + 1];
		else
			sum = sum + output_nybbles[i];
		end
		output = output .. "$" .. string.format("%02X", sum) .. ", ";
	end
	output = output .. "\nsampleDataEnd:"
	
	file:write(output)
	file:close()
end

function makePreview()
	sdn = love.sound.newSoundData( #output_nybbles, 11025, 16, 1 )
	for i = 1, #output_nybbles do
		local new = ((output_nybbles[i] / 15) * 2) - 1
		sdn:setSample( i - 1, new )
	end
end

function love.update(dt)
	if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
		scrollX = scrollX - 4;
	end
	if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
		scrollX = scrollX + 4;
	end
end

function love.draw()
	for i = 1, #output_nybbles do
		local px = i - scrollX;
		local py = 320 - (5 * output_nybbles[i])
		love.graphics.points(px,py)
	end
end