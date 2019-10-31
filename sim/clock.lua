return coroutine.wrap(function(dt)
	local light = require 'light' :new {on = true, r = 0, g = 0xff}
	local lights = {}

	--  66666
	-- 5     7
	-- 5     7
	-- 5     7
	--  11111
	-- 4     2
	-- 4     2
	-- 4     2
	--  33333

	local function digit(lights, xoffset, yoffset)
		xoffset = xoffset or 0
		yoffset = yoffset or 0
		for i=1,5 do table.insert(lights, light:new { x = xoffset + i+1, y = yoffset + 7    }) end -- 1
		for i=1,5 do table.insert(lights, light:new { x = xoffset + 7,   y = yoffset + 7+i  }) end -- 2
		for i=1,5 do table.insert(lights, light:new { x = xoffset + 7-i, y = yoffset + 13   }) end -- 3
		for i=1,5 do table.insert(lights, light:new { x = xoffset + 1,   y = yoffset + 13-i }) end -- 4
		for i=1,5 do table.insert(lights, light:new { x = xoffset + 1,   y = yoffset + 7-i  }) end -- 5
		for i=1,5 do table.insert(lights, light:new { x = xoffset + i+1, y = yoffset + 1    }) end -- 1
		for i=1,5 do table.insert(lights, light:new { x = xoffset + 7,   y = yoffset + 1+i  }) end -- 2
	end

	digit(lights)
	digit(lights, 8)
	digit(lights, 16+1)
	digit(lights, 24+1)

	function love.draw()
		for _i, light in ipairs(lights) do
			light:draw()
		end
	end

	local yield = coroutine.yield
	while true do
		dt = yield()
	end
end)
