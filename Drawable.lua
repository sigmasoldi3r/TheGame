--[[
	Drawable interface.
	For discrette objects that are being drawn.
]]

function Drawable()
	local new = {};
	
	--@Override
	function new:draw()
		invoke.pure_virtual("Drawable:draw");
	end
	
	return new;
end