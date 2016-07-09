--[[
	Controller object for the game.
]]

function Controller()
	local new = {};
	
	--Sould be constants
	local FPS_SAMPLE_RATE = 15;
	
	--Fields
	local dFPS, aFPS = 0, 0;
	
	--Methods
	function new:init()
		FPS = 0;
		ROOM_MANAGER = RoomManager();
		ROOM_MANAGER:begin();
	end
	
	function new:think(dt)
		aFPS = aFPS + math.ceil(1/dt);
		dFPS = dFPS + 1;
		if (dFPS > FPS_SAMPLE_RATE) then
			FPS = math.floor(aFPS / dFPS);
			dFPS = 0;
			aFPS = 0;
		end
		ROOM_MANAGER:getCurrentRoom():think();
	end
	
	function new:mousePress( x, y, button, istouch )
		ROOM_MANAGER:getCurrentRoom():mousePress(x,y,button,istouch);
	end
	
	--Draws the FPSs if needed.
	local function drawFPS()
		--Set it red if FPS drops below 15, below 30 just yellow.
		love.graphics.setColor(
			255,
			(FPS > 15) and 255 or 0,
			(FPS > 30) and 255 or 0,
			255
		);
		local state, percent, seconds = love.system.getPowerInfo();
		local cores = love.system.getProcessorCount();
		local opsy = love.system.getOS();
		love.graphics.print(
			FPS.." fps\nCores: "..
			cores.."\nPower info\n\tState: "..(state or 'UNKNOWN')..
			"\n\tPercent: "..(percent or 'NaN').."%\n\tSeconds: "..(seconds or 0)..
			"\n== Operating System: "..opsy.." ==",
			4,
			4
		);
	end
	
	function new:draw()
		--drawFPS();
		--Draw the room contents
		ROOM_MANAGER:getCurrentRoom():draw();
	end
	
	return new;
end