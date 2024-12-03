local M = {}

function M.play_animation(self, anim)
	if self.anim ~= anim then
		sprite.play_flipbook("#sprite", anim)
		self.anim = anim
	end
end

return M