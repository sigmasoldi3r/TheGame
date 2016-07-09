--[[
	A player (Human).
]]

function Player(iname)
	local new = {};
	
	--Fields
	local name = iname;
	
	--Methods
	function new:getName()
		return name;
	end
	
	return new;
end