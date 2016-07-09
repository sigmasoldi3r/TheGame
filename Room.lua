--[[
	A room holds drawable entities that will be drawn on top controller.
]]

function Room(title)
	local new = {};
	
	--Fields
	new.title = title;
	new.invoker = nil;
	local factory = WidgetFactory(new);
	local objects = {};
	
	--Methods
	function new:think()
		for k, _ in pairs(objects) do
			k:think();
		end
	end
	
	function new:getFactory()
		return factory;
	end
	
	function new:init()
		love.window.setTitle( self.title );
	end
	
	--@Override
	function new:setup()
		invoke.pure_virtual("Room:setup");
	end
	
	function new:mousePress(x, y, button, touch)
		for k, _ in pairs(objects) do
			if (k.mousePress) then
				k:mousePress(x, y, button, touch);
			end
		end
	end
	
	function new:draw()
		for k, _ in pairs(objects) do
			k:draw();
		end
	end
	
	function new:add(drawable)
		objects[drawable] = true;
	end
	
	function new:remove(drawable)
		objects[drawable] = nil;
	end
	
	return new;
end