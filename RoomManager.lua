--[[
	This is the room manager.
	It should be a singleton, if your controller is properly defined.
]]

local MAIN_ROOM_INVOKER = function() return false; end;

--Use this to set the entry room. ie: the main menu
function MAIN(Room)
	if (type(Room) ~= "function") then
		error("FATAL! Passed a non-constructor reference to the room builder!");
	end
	MAIN_ROOM_INVOKER = Room;
end

function RoomManager()
	local new = {};
	
	--fields
	local current = 0;
	
	--methods
	function new:begin(...)
		current = MAIN_ROOM_INVOKER(...);
		current.invoker = self;
		current:init();
		current:setup();
	end
	
	function new:setRoom(constructor, ...)
		MAIN_ROOM_INVOKER = constructor;
		self:begin(...);
	end
	
	function new:getCurrentRoom()
		return current;
	end
	
	return new;
end