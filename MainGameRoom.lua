--[[
	The main game's room.
	It controls the game in itslef.
	---
	You must pass a list of players, if you want them to play along ofcourse.
]]
require("Biome");
local DEFAULT_GEN = {
	w = 8,
	h = 4,
	biolist = BIOMES,
	stages = 4
};

function MainGameRoom(players, genopts)
	local new = Room(
		"Play the game! ("..
		( ( (#players > 1) and ( (#players).." players)" ) ) or
		"singleplayer)")
	);
	
	--Only copy overriden ones.
	local opts = {
		genopts.w or DEFAULT_GEN.w,
		genopts.h or DEFAULT_GEN.h,
		genopts.biolist or DEFAULT_GEN.biolist,
		genopts.stages or DEFAULT_GEN.stages
	};
	
	function new:setup()
	
	end
	
	return new;
end