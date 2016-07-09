--[[
	The game, Main Entry point.
]]
--Runtime lib
invoke = {
	pure_virtual = function(func)
		error(
			"Trying to invoke a pure virtual function '"
			..(func or "undef")
			.."' that has not been implemented!\n(Did you override this method?)");
	end
};

--Default graphical issues
DEFAULT_FONT = love.graphics.newImageFont("awesome.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"");

ScrW = love.window.getWidth;
ScrH = love.window.getHeight;

--Requrie first or else you will have problems setting the main room.
require "RoomManager";
--Classloader library
for k, file in pairs(love.filesystem.getDirectoryItems( "." )) do
	if (file ~= "main.lua" and string.find(file, ".lua")) then
		local class = file:gsub("(.-)%.lua", "%1");
		require( class );
		print("Loading class "..class.."...");
	else
		print("Skipping file "..file.."...");
	end
end

require "Controller";

--The controller's instance
local controller = Controller();

love.load = controller.init;
love.draw = controller.draw;

--Hardlinking is not permitted here.
function love.update(dt)
    controller:think(dt);
end

function love.mousepressed( x, y, button, istouch )
	controller.mousePress( x, y, button, istouch );
end