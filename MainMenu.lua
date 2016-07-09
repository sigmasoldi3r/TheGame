--[[
	Main Menu Room!
]]


function MainMenu()
	local new = Room("Main menu - The Game v 1.0");
	
	function new:setup()
		local newGame = self:getFactory():create(Button, "Start Game", function()
			self.invoker:setRoom(PlayerBuilder);
		end);
		newGame.x = ScrW()/2 - newGame.w/2;
		newGame.y = ScrH()/2 - newGame.h/2;
		newGame.textColor = BUTTON_TEXT_COLOR;
		newGame.color = BUTTON_BG_COLOR;
		
		local loadGame = self:getFactory():create(Button, "Load Game", function() end);
		loadGame.x = ScrW()/2 - loadGame.w/2;
		loadGame.y = ScrH()/2 - loadGame.h/2 + loadGame.h + 5;
		loadGame.textColor = {r=200, g=0, b=0, a=100};
		loadGame.color = {r=10, g=10, b=100, a=250};
		
		local exitGame = self:getFactory():create(Button, "Exit Game", function() love.event.quit(); end);
		exitGame.x = ScrW()/2 - exitGame.w/2;
		exitGame.y = ScrH()/2 - exitGame.h/2 + exitGame.h*2 + 10;
		exitGame.textColor = BUTTON_TEXT_COLOR;
		exitGame.color = BUTTON_BG_COLOR;
		
	end
	
	return new;
end
MAIN(MainMenu);