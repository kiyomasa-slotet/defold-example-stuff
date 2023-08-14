local M = {}

function M.on_input(self, action_id, action)
	
	-- keyboard input
	if action_id == hash('key_W') then
		self.input.y = 1
	elseif action_id == hash('key_A') then
		self.input.x = -1
	elseif action_id == hash('key_S') then
		self.input.y = -1
	elseif action_id == hash('key_D') then
		self.input.x = 1
	end

	-- gamepad input
	if action_id == hash('gamepad_lstick_left') then
		self.input.x = -1
	elseif action_id == hash('gamepad_lstick_right') then
		self.input.x = 1
	elseif action_id == hash('gamepad_lstick_up') then
		self.input.y = 1
	elseif action_id == hash('gamepad_lstick_down') then
		self.input.y = -1
	elseif action_id == hash('gamepad_rpad_down') then
		self.input_dash = true
	end
end

return M