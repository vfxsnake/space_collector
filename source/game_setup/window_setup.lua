--[[
    setup all window preferences 
--]]

Window = {}
Window.__index = Window
Window.width = 1200
Window.height = 800
Window.min_width = 800
Window.min_height = 600
Window.resizable = true

function Window:setup()
    love.window.setMode(self.width,
                        self.height,
                        {resizable=self.resizable,
                         vsync=false,
                         minwidth=self.min_width,
                         minheight=self.min_height})
end