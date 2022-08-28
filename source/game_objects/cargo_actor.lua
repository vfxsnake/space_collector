require("source/game_objects/base_sprite_actor")

CargoActor = {}
CargoActor.__index = CargoActor
setmetatable(CargoActor, BaseSpriteActor)
CargoActor.controller = CharacterController
CargoActor.weight = 100
CargoActor.value = 200
CargoActor:set_base_color(0,255,10)

function CargoActor:update(dt)
    self:set_position(self.pos_x + self.vel_x * dt, self.pos_y + self.vel_y * dt)
end