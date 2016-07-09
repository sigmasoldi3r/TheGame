--[[
	This has position in the space.
]]

function Living()
	local new = Drawable();
	
	new.x = 0;
	new.y = 0;
	
	function new:draw()
		love.graphics.print("Hi!", self.x, self.y);
	end
	
	--@Override
	function new:think()
		invoke.pure_virtual("Widget:think");
	end
	
	return new;
end