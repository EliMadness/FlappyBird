--[[
    Pipe Class
]]

Pipe = Class{}

-- since we only want the image loaded once, not per instantation, define it externally
local PIPE_IMAGE = love.graphics.newImage('pipe.png')

function Pipe:init(orientation, y)
    self.x = VIRTUAL_WIDTH + 64
    self.y = y

    self.width = PIPE_WIDTH
    self.height = PIPE_HEIGHT

    self.orientation = orientation
end

function Pipe:update(dt)
    
end

function Pipe:render()
    love.graphics.draw(PIPE_IMAGE, self.x, 

        -- shift pipe rendering down by its height if flipped vertically
        (self.orientation == 'top' and self.y + PIPE_HEIGHT or self.y), 

        -- scaling by -1 on a given axis flips (mirrors) the image on that axis
        0, 1, self.orientation == 'top' and -1 or 1)
end