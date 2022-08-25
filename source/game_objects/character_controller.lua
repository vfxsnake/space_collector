CharacterController = {}
CharacterController.__index = CharacterController
CharacterController.inpulse = 3
CharacterController.break_ration = 8

function CharacterController:move_engine(character_reference)
    if character_reference.fuell <= 0 then
        return 0 , 0, 0
    end
    local vel_x = 0
    local vel_y = 0
    local used_force = 0
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        vel_y = character_reference.vel_y + self.inpulse
        used_force = self.inpulse
    end
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        vel_y = character_reference.vel_y - self.inpulse
        used_force = self.inpulse
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        vel_x = character_reference.vel_x - self.inpulse
        used_force = self.inpulse
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        vel_x = character_reference.vel_x + self.inpulse
        used_force = self.inpulse
    end
    if love.keyboard.isDown("space") then
        vel_x  = character_reference.vel_x * -self.break_ration
        vel_y  = character_reference.vel_y * -self.break_ration
        used_force = math.sqrt(math.pow(character_reference.vel_x, 2) + math.pow(character_reference.vel_y, 2)) * 0.5
    end
    return vel_x, vel_y, used_force
end


    function CharacterController:move(character_reference, dt)
        local vel_x, vel_y, energy_cost = self:move_engine(character_reference)
        character_reference:set_velocity(character_reference.vel_x + vel_x * dt, character_reference.vel_y + vel_y * dt)
        character_reference:set_position(character_reference.pos_x + character_reference.vel_x , character_reference.pos_y + character_reference.vel_y)
        character_reference.fuell = character_reference.fuell - energy_cost * dt
    end