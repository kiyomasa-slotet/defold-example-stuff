local anim = require "Main.objects.player.module.play_animation"

local M = {}

local function update_animation(self)
	-- to WALK animation

	if self.input == vmath.vector3(-1, 0, 0) and self.input_dash == false then
		anim.play_animation(self, 'player_walking')
		self.dir = vmath.vector3(-1, 0, 0)
	elseif self.input == vmath.vector3(1, 0, 0) and self.input_dash == false then
		anim.play_animation(self, 'player_walking')
		self.dir = vmath.vector3(1, 0, 0)
	elseif self.input == vmath.vector3(0, 1, 0) and self.input_dash == false then
		anim.play_animation(self, 'player_walking')
		self.dir = vmath.vector3(0, 1, 0)
	elseif self.input == vmath.vector3(0, -1, 0) and self.input_dash == false then
		anim.play_animation(self, 'player_walking')
		self.dir = vmath.vector3(0, -1, 0)

	elseif self.input == vmath.vector3(-1, 1, 0) and self.input_dash == false then
		anim.play_animation(self, 'player_walking')
		self.dir = vmath.vector3(-1, 1, 0)
	elseif self.input == vmath.vector3(-1, -1, 0) and self.input_dash == false then
		anim.play_animation(self, 'player_walking')
		self.dir = vmath.vector3(-1, -1, 0)
	elseif self.input == vmath.vector3(1, 1, 0) and self.input_dash == false then
		anim.play_animation(self, 'player_walking')
		self.dir = vmath.vector3(1, 1, 0)
	elseif self.input == vmath.vector3(1, -1, 0) and self.input_dash == false then
		anim.play_animation(self, 'player_walking')
		self.dir = vmath.vector3(1, -1, 0)


	--[[
		-- to running animation
	elseif self.input == vmath.vector3(-1, 0, 0) and self.input_dash then
		anim.play_animation(self, 'running_left')
	elseif self.input == vmath.vector3(1, 0, 0) and self.input_dash then
		anim.play_animation(self, 'running_right')
		self.dir = vmath.vector3(1, 0, 0)
	elseif self.input == vmath.vector3(0, 1, 0) and self.input_dash then
		anim.play_animation(self, 'running_up')
		self.dir = vmath.vector3(0, 1, 0)
	elseif self.input == vmath.vector3(0, -1, 0) and self.input_dash then
		anim.play_animation(self, 'running_down')
		self.dir = vmath.vector3(0, -1, 0)

	elseif self.input == vmath.vector3(-1, 1, 0) and self.input_dash then
		anim.play_animation(self, 'running_up_left')
		self.dir = vmath.vector3(-1, 1, 0)
	elseif self.input == vmath.vector3(-1, -1, 0) and self.input_dash then
		anim.play_animation(self, 'running_down_left')
		self.dir = vmath.vector3(-1, -1, 0)
	elseif self.input == vmath.vector3(1, 1, 0) and self.input_dash then
		anim.play_animation(self, 'running_up_right')
		self.dir = vmath.vector3(1, 1, 0)
	elseif self.input == vmath.vector3(1, -1, 0) and self.input_dash then
		anim.play_animation(self, 'running_down_right')
		self.dir = vmath.vector3(1, -1, 0)

	--]]

		-- to IDLE animation
	elseif self.input == vmath.vector3(0, 0, 0) then
		if self.dir == vmath.vector3(-1, 0, 0) then
			anim.play_animation(self, 'player_standing')
		elseif self.dir == vmath.vector3(1, 0, 0) then
			anim.play_animation(self, 'player_standing')
		elseif self.dir == vmath.vector3(0, -1, 0) then
			anim.play_animation(self, 'player_standing')
		elseif self.dir == vmath.vector3(0, 1, 0) then
			anim.play_animation(self, 'player_standing')
		elseif self.dir == vmath.vector3(-1, 1, 0) then
			anim.play_animation(self, 'player_standing')
		elseif self.dir == vmath.vector3(-1, -1, 0) then
			anim.play_animation(self, 'player_standing')
		elseif self.dir == vmath.vector3(1, 1, 0) then
			anim.play_animation(self, 'player_standing')
		elseif self.dir == vmath.vector3(1, -1, 0) then
			anim.play_animation(self, 'player_standing')
		else
			anim.play_animation(self, 'player_standing')
		end
	end
end

function M.update(self, dt)
	local movement
	if self.input_dash == true then
		movement = self.input * 5
	elseif self.input_dash == false then
		movement = self.input * 3.4
	end

	local p = go.get_position()
	p.z = (-p.y * 0.0001) - 0.01
	
	go.set_position(vmath.vector3(p.x, p.y, p.z))
	go.set_position(p + movement)

	update_animation(self)

	self.input = vmath.vector3()
	self.correction = vmath.vector3()
	self.input_dash = false
	--print(p.z)
end

return M