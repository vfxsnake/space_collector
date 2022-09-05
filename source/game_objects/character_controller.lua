CharacterController = {}
CharacterController.__index = CharacterController
CharacterController.inpulse = 1
CharacterController.break_ration = 8
CharacterController.break_ration_cost = 0.25

function CharacterController:move(current_vel_x, current_vel_y)
    local vel_x = 0
    local vel_y = 0
    local used_force = 0
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        vel_y = current_vel_y + self.inpulse
        used_force = self.inpulse
    end
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        vel_y = current_vel_y - self.inpulse
        used_force = self.inpulse
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        vel_x = current_vel_x - self.inpulse
        used_force = self.inpulse
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        vel_x = current_vel_x + self.inpulse
        used_force = self.inpulse
    end
    if love.keyboard.isDown("space") then
        vel_x  = current_vel_x * -self.break_ration
        vel_y  = current_vel_y * -self.break_ration
        used_force = math.sqrt(math.pow(current_vel_x, 2) + math.pow(current_vel_y, 2)) * self.break_ration_cost
    end
    return vel_x, vel_y, used_force
end

