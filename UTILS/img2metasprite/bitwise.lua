-- Implementing my own bitwise functions cus lua website has mostly dead links now :(
-- http://lua-users.org/wiki/BitwiseOperators

module(..., package.seeall);

function band( num, mask )
	
	local sum = 0;
	for i = 0, 7 do
		local zeroup = math.pow(2,i);
		local oneup = math.pow(2,(i + 1));
		
		if ( num % oneup ) >= ( oneup / 2 ) then
		if ( mask % oneup ) >= ( oneup / 2 ) then
			sum = sum + zeroup;
		end
		end
	end
	
	return sum;
end

function bxor( num, mask )
	
	local sum = 0;
	for i = 0, 7 do
		local zeroup = math.pow(2,i);
		local oneup = math.pow(2,(i + 1));
		
		local numTrue = ( num % oneup ) >= ( oneup / 2 );
		local mskTrue = ( mask % oneup ) >= ( oneup / 2 );
		
		if (numTrue and (not mskTrue)) or (mskTrue and (not numTrue)) then
			sum = sum + zeroup;
		end
	end
	
	return sum;
end