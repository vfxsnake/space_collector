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
CharacterActor.fuell = 100
CharacterActor.energy_comsumptions = 0.01

function CharacterActor:set_velocity(v_x, v_y)
    self.vel_x = v_x
    self.vel_y = v_y
end

function CharacterActor:update(dt)
    self.controller:move(self, dt)

end

