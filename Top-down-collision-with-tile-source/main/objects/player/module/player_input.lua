--local global_param = require "main.PRISM_CORE.global.param"

local M = {}

function M.on_input(self, action_id, action)
	-- keyboard input
	if action_id == hash('key_W') then
		self.input.y = 1
	elseif action_id == hash('key_A') then
		self.input.x = -1
		sprite.set_hflip('#sprite', true)
	elseif action_id == hash('key_S') then
		self.input.y = -1
	elseif action_id == hash('key_D') then
		self.input.x = 1
		sprite.set_hflip('#sprite', false)
	elseif action_id == hash('key_Space') then
		self.input_dash = true
		print('a')

		-- interact
		--[[
	elseif action_id == hash('key_E') and action.pressed then
		if global_param.player_interact == false then
			return
		else
			print(global_param.interact_id)
			msg.post('/interact#interacts', 'talk_to_NPC')
		end
		]]
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