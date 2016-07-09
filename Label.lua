--[[
	A label widget.
]]

function Label(text)
	local new = Panel();
	
	--fields
	new.text = text;
	new.font = DEFAULT_FONT;
	
	--Methods
	function new:draw()
		love.graphics.setColor(
			self.color.r,
			self.color.g,
			self.color.b,
			self.color.a
		);
		love.graphics.rectangle( "fill", self.x, self.y, self.w, self.h );
		love.graphics.setFont(self.font);
		love.graphics.print( self.text, self.x, self.y );
	end
	
	return new;
end