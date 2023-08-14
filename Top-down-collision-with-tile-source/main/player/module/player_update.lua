local M = {}

function M.update(self, dt)
	local movement
	if self.input_dash == true then
		movement = self.input * 9
	elseif self.input_dash == false then
		movement = self.input * 5
	end

	local p = go.get_position()
	go.set_position(p + movement)

	self.input = vmath.vector3()
	self.correction = vmath.vector3()
	self.input_dash = false
end

return M