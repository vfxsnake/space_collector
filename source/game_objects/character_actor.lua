--[[
    the base class for creating characters with update method
    and has a controller component.
--]]
require("source/game_objects/base_sprite_actor")
require("source/game_objects/character_controller")
require("source/game_utilities/vector_2d")

CharacterActor = {}
CharacterActor.__index = CharacterActor
setmetatable(CharacterActor, BaseSpriteActor)
CharacterActor.controller = CharacterController
CharacterActor.vel_x = 0
CharacterActor.vel_y = 0
CharacterActor.fuel = 100
CharacterActor.oxigen = 10
CharacterActor.stamina = 100
CharacterActor.energy_comsumption = 0.01
CharacterActor.resources_comsumption = 0.02
CharacterActor.rotation = 0
CharacterActor:set_scale(50, 50)
CharacterActor:set_base_color(125, 0, 125)
CharacterActor:set_sprite_texture("graphics/SpaceShip.png")

function CharacterActor:new(instance)
    instance = instance or {}   -- create object if user does not provide one
    self.__index = self
    setmetatable(instance, self)
    return instance
  end

function CharacterActor:update(dt)
    if self.fuel > 0 then
        local vel_x, vel_y, energy_cost = self.controller:move(self.vel_x, self.vel_y)
        self:set_velocity(self.vel_x + vel_x * dt, self.vel_y + vel_y * dt)
        self.fuel = self.fuel - (energy_cost + self.energy_comsumption) * dt
        self.oxigen = self.oxigen - self.resources_comsumption * dt
    end
    -- ensure fuell is not les than zero
    if self.fuel < 0 then
        self.fuel = 0
    end
    self:set_position(self.pos_x + self.vel_x , self.pos_y + self.vel_y)
    self.rotation = self:calculate_rotation()
end
function CharacterActor:draw()

    if self.sprite_texture_image then
        local width  = self.sprite_texture_image:getWidth()
	    local height = self.sprite_texture_image:getHeight()
        local rotation = self:calculate_rotation()
        love.graphics.draw(self.sprite_texture_image, self.pos_x, self.pos_y, self.rotation, 0.0512,0.0512, width/2, height/2)
    else
        BaseSpriteActor.draw(self)
    end
    
end

function CharacterActor:get_bounding_data()
    return {x = self.pos_x, y = self.pos_y, rad = self.size_width/2}
end

function CharacterActor:calculate_rotation()
    local up_vector = Vec2d:new()
    local velocity = Vec2d:new()
    up_vector:set_value(0.0, -1)
    up_vector:set_value(0.0, -1)
    up_vector = up_vector:normalized()
    velocity:set_value(self.vel_x, self.vel_y)
    velocity = velocity:normalized()
    local dot_product = up_vector:dot(velocity)
    if self.vel_x > 0 then
        return math.acos(dot_product) 
    end
    return -math.acos(dot_product)
end
