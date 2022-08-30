require("source/game_objects/base_sprite_actor")

CargoActor = {}
CargoActor.__index = CargoActor
setmetatable(CargoActor, BaseSpriteActor)
CargoActor.weight = 100
CargoActor.value = 200
CargoActor:set_base_color(0,255,10)

function CargoActor:new(instance)
    instance = instance or {}   -- create object if user does not provide one
    self.__index = self
    setmetatable(instance, self)
    return instance
  end

function CargoActor:update(dt)
    self:set_position(self.pos_x + self.vel_x * dt, self.pos_y + self.vel_y * dt)
end

function CargoActor:get_distance_square_to(pos_x, pos_y)
    return math.pow(self.pos_x - pos_x,2)+ math.pow(self.pos_y - pos_y, 2)
end