local M = {}

function M.on_message(self, message_id, message, sender)
	if message_id == hash("contact_point_response") then
		if message.distance > 0 then
			local proj = vmath.project(self.correction, message.normal * message.distance)
			if proj < 1 then
				local comp = (message.distance - message.distance * proj) * message.normal
				go.set_position(go.get_position() + comp)
				self.correction = self.correction + comp
			end
		end
	end

	if message_id == hash("contact_point_response") then
		if message.distance > 0 then
			local proj = vmath.project(self.correction, message.normal * message.distance)
			if proj < 1 then
				local comp = (message.distance - message.distance * proj) * message.normal
				go.set_position(go.get_position() + comp)
				self.correction = self.correction + comp
			end
		end
	end
end

return M