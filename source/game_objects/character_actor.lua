--[[
    the base class for creating characters with update method
    and has a controller component.
--]]
require("source/game_objects/base_sprite_actor")
require("source/game_objects/character_controller")

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
CharacterActor:set_scale(20, 20)
CharacterActor:set_base_color(125, 0, 125)

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
end

function CharacterActor:get_bounding_data()
    return {x = self.pos_x, y = self.pos_y, rad = self.size_width/2}
end