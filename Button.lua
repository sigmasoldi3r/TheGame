--[[
	Button Widget, may be used in menues.
	---
	Directions to use this widget:
	Create a new button with Button(), then override the onClick() method with an anonimous function.
	
	Example of usage:
	
	local b = Button("My Button", function()
		--Your stuff
	end);
]]

function Button(text, clickCallback)
	local new = Label(text);
	
	--fields
	new.textColor = {r=0, g=0, b=0, a=255};
	new.onClick = clickCallback or function() end;
	
	new.padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5
	};
	
	--methods
	function new:sizeToContents()
		local w = self.font:getWidth( self.text );
		local h = self.font:getHeight();
		self.w = w + self.padding.left + self.padding.right;
		self.h = h + self.padding.top + self.padding.bottom;
	end
	new:sizeToContents();
	
	function new:setText(text)
		self.text = text;
		self:sizeToContents();
	end
	
	function new:draw()
		local hoverMult = self.inside and 1 or 0.9;
		love.graphics.setColor(
			self.color.r * hoverMult,
			self.color.g * hoverMult,
			self.color.b * hoverMult,
			self.color.a
		);
		love.graphics.rectangle(
			"fill",
			self.x,
			self.y,
			self.w,
			self.h );
		love.graphics.setColor(
			self.textColor.r,
			self.textColor.g,
			self.textColor.b,
			self.textColor.a * hoverMult
		);
		love.graphics.setFont(self.font);
		love.graphics.print( self.text, self.x + self.padding.left, self.y + self.padding.top );
	end
	
	return new;
end