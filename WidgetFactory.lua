--[[
	This will assemble widgets for a specific room.
]]

function WidgetFactory(room)
	local new = {};
	
	new.room = room;
	
	function new:create(constructor, ...)
		local o = constructor(...);
		
		self.room:add(o);
		
		return o;
	end
	
	return new;
end