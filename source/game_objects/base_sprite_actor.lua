--[[ 
    this is the base code for all sprites
    it has poisiotn and size. and the paht to it's sprites.
--]]
BaseSpriteActor = {}

BaseSpriteActor.__index = BaseSpriteActor
BaseSpriteActor.pos_x = 0
BaseSpriteActor.pos_y = 0
BaseSpriteActor.size_width = 10
BaseSpriteActor.size_heigth = 10
BaseSpriteActor.sprite_texture_image = nil
BaseSpriteActor.base_color = {r=255, g=255, b=225}

--[[
    lua functions notation:
    Piriod '.' is for flaggin that this is a private fucntion, or for static functions.
    BaseSpriteActor.new()
    colon ':' for public fucntions. it allows us to use the self keyword
    BaseSpriteActor:get_name()       
--]]

function BaseSpriteActor:get_position()
    return self.pos_x, self.pos_y
end

function BaseSpriteActor:get_scale()
    return self.size_width, self.size_heigth
end

function BaseSpriteActor:set_position(x, y)
    self.pos_x = x
    self.pos_y = y
end
function BaseSpriteActor:set_scale(width,height)
    self.size_width = width
    self.size_heigth = height
end

function BaseSpriteActor:get_sprite_center()
    local center_x = self.pos_x - math.floor(self.size_width/2)
    local center_y = self.pos_y - math.floor(self.size_heigth/2)
    return center_x, center_y
end

function BaseSpriteActor:set_sprite_texture(image_path)
    local texture_object = love.graphics.newImage(image_path)
    self.sprite_texture_image = texture_object
end

function BaseSpriteActor:set_base_color(r, g, b)
    self.base_color.r = r
    self.base_color.g = g
    self.base_color.b = b
end

function BaseSpriteActor:set_velocity(v_x, v_y)
    self.vel_x = v_x
    self.vel_y = v_y
end

function BaseSpriteActor:get_base_color()
    return self.base_color.r, self.base_color.g, self.base_color.b
end

function BaseSpriteActor:draw(shape_type)
    local center_x, center_y = self:get_sprite_center()
    
    love.graphics.setColor(self.base_color.r, self.base_color.g, self.base_color.b)
    if shape_type == "rectangle" then
        love.graphics.rectangle("fill", center_x , center_y, self.size_width, self.size_heigth)
    else
        love.graphics.circle("fill", self.pos_x, self.pos_y, self.size_width/2)
    end
    love.graphics.setColor(255,255,255)
end
