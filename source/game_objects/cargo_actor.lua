require("source/game_objects/base_sprite_actor")

CargoActor = {}
CargoActor.__index = CargoActor
setmetatable(CargoActor, BaseSpriteActor)
CargoActor.stamina = 10
CargoActor.reasource_usage = 1
CargoActor.rotation_direction = 1
CargoActor.rotation_speed = 0.5
CargoActor.rotation = 0.0
CargoActor.sprite_list = {  'graphics/Astronaut_B.png',
                            'graphics/Astronaut_P.png',
                            'graphics/Astronaut_R.png',
                            'graphics/Astronaut_Y.png'
                         }
CargoActor:set_base_color(0,255,10)
CargoActor:set_sprite_texture(CargoActor.sprite_list[1])

function CargoActor:new(instance)
    instance = instance or {}   -- create object if user does not provide one
    self.__index = self
    setmetatable(instance, self)
    return instance
  end

function CargoActor:update(dt)
    self.stamina = self.stamina - self.reasource_usage * dt 
    self:set_position(self.pos_x + self.vel_x * dt, self.pos_y + self.vel_y * dt)
    self:calculate_rotation(dt)
end

function CargoActor:get_distance_square_to(pos_x, pos_y)
    return math.pow(self.pos_x - pos_x,2)+ math.pow(self.pos_y - pos_y, 2)
end

function CargoActor:is_death()
    if self.pos_x < 0 or self.pos_x > 1200 or self.pos_y < 0 or self.pos_y > 800 then
        return true
    end
    return false
end

function CargoActor:draw()

    if self.sprite_texture_image then
        local width  = self.sprite_texture_image:getWidth()
	    local height = self.sprite_texture_image:getHeight()
        love.graphics.draw(self.sprite_texture_image, self.pos_x, self.pos_y, self.rotation, 0.1,0.1, width/2, height/2)
    else
        BaseSpriteActor.draw(self)
    end
    
end

function CargoActor:calculate_rotation(dt)
    self.rotation = self.rotation + self.rotation_speed * dt
end
