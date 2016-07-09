--[[
	This is a basic panel widget.
]]

function Panel()
	local new = Widget();
	
	--fields
	new.color = {r=255, g=255, b=255, a=255}; -- Vec4 represents the colours
	
	function new:draw()
		love.graphics.setColor(
			self.color.r,
			self.color.g,
			self.color.b,
			self.color.a
		);
		love.graphics.rectangle( "fill", self.x, self.y, self.w, self.h );
	end
	
	return new;
end