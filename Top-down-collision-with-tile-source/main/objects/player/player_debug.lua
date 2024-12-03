local M = {}

local function change_label(self, state_name)
	if self.state ~= state_name then
		label.set_text("#state_label", state_name)
		self.state = state_name
	end
end

function M.update(self, dt)
	if self.input ~= vmath.vector3(0, 0, 0) then
		change_label(self, 'Walking')
	elseif self.input == vmath.vector3(0, 0, 0) then
		change_label(self, 'Standing')
	end
end

return M