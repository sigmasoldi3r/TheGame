--[[
	This is the player builder.
	It will invoke the next room.
]]

--Constants
local PLAYER_INPUT = "Enter a player's name: ";
local PLAYER_LIST = "== PLAYERS ==";

function PlayerBuilder()
	local new = Room("The Game - Create players");
	
	----- Fields -----
	
	--Libraries
	local utf8 = require("utf8")
	
	--Labels
	local label = Label("");
	local playerList = Label("");
	
	--Player list
	local players = {};
	local pool = "";
	
	love.keyboard.setKeyRepeat(true); --Setup for backspace-multitrigger
	
	--Methods
	local function updateLabels()
		label.text = PLAYER_INPUT..pool;
	end
	
	--Pool the input data
	function love.textinput(t)
		pool = pool..t;
		updateLabels();
	end
	
	function love.keypressed(key)
		if key == "backspace" then
			-- get the byte offset to the last UTF-8 character in the string.
			local byteoffset = utf8.offset(pool, -1)
	 
			if byteoffset then
				-- remove the last UTF-8 character.
				-- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
				pool = string.sub(pool, 1, byteoffset - 1)
			end
		elseif key == "return" then
			--if it's a blank, then don't enter more players, just start the game.
			--Elsewhere register a new player.
			if (pool:len() == 0 and #players > 0) then
				new.invoker:setRoom(MainGameRoom, players, {});
			elseif (pool:len() ~= 0) then
				table.insert(players, pool);
				playerList.text = playerList.text.."\n\t"..(#players)..". "..pool;
			end
			pool = "";
		end
		updateLabels();
	end
		
	function new:setup()
		label = self:getFactory():create(Label, PLAYER_INPUT);
		label.x = 10;
		label.y = 10;
		
		playerList = self:getFactory():create(Label, PLAYER_LIST);
		playerList.x = 10;
		playerList.y = 25;
		
		-- local inputController = self:getFactory():create(Living);
		-- function inputController:draw() end
		-- function inputController:think()
			
		-- end
		
		local gotoMenu = self:getFactory():create(Button, "Main Menu", function()
			self.invoker:setRoom(MainMenu);
		end);
		gotoMenu.x = ScrW() - gotoMenu.w;
		gotoMenu.y = 0;
		gotoMenu.textColor = BUTTON_TEXT_COLOR;
		gotoMenu.color = BUTTON_BG_COLOR;
	end
	
	return new;
end