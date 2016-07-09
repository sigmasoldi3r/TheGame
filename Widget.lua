--[[
	GUI Widget base.
]]

function Widget()
	local new = Living();
	
	--Fields
	new.w = 0;
	new.h = 0;
	new.inside = false;
	
	--@Override not mandatory
	function new:onClick(btn) end
	
	
	--This makes the widget know of itself being pressed.
	function new:think()
		--Compute if hovering or not.
		self.inside = 
			love.mouse.getX() >= self.x and love.mouse.getX() <= (self.x + self.w) and
			love.mouse.getY() >= self.y and love.mouse.getY() <= (self.y + self.h);
	end
	
	--A hook that checks out when the mouse is being pressed.
	function new:mousePress( x, y, button, istouch )
		if (self.inside) then
			self:onClick(button);
		end
	end
	
	return new;
end