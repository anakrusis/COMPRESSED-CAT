function love.load()
	--soundData = love.sound.newSoundData(
end

function love.filedropped(file)
	output_nybbles = {}
	soundData = love.sound.newSoundData(file)
	
	for i = 0, soundData:getSampleCount() do
		-- currently reading every fourth sample of a 44100hz source --> 11025hz output
		if i % 4 == 0 then
			local cs = soundData:getSample(i); -- range -1 to 1
			cs = ( 1 + cs ) / 2 -- 0 to 1
			cs = math.floor(cs * 16) -- 0 to 15
			print(cs)
			
			table.insert(output_nybbles, cs)
		end
	end
	
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
	
	file:write(output)
	file:close()
end

function love.update(dt)

end

function love.draw()

end