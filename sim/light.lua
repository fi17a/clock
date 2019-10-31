local light = {
	r = 0xff,
	g = 0xff,
	b = 0xff,
	x = 0,
	y = 0,
	radius = 5,
	on = false,
	grid = 22
}

function light:new(new)
	new = new or {}
	self.__meta = rawget(self, '__meta') or {__index = self}
	return setmetatable(new, self.__meta)
end

function light:draw()
	love.graphics.setColor(0.4, 0.4, 0.4)
	love.graphics.circle('fill', self.x*self.grid, self.y*self.grid, self.radius+2)
	if self.on then
		love.graphics.setColor(self.r/0xff, self.g/0xff, self.b/0xff)
		love.graphics.circle('fill', self.x*self.grid, self.y*self.grid, self.radius)
	end
end

return light
