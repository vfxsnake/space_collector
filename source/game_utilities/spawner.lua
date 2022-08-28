require("source/game_objects/cargo_actor")
Spawner = {}
Spawner.__index = Spawner
Spawner.number_of_instances = 5
Spawner.seed = 0.5
Spawner.velocity_limit = 10
Spawner.actor_array = {}

function Spawner:spawn_actors(actor_class, min_x, max_x, min_y, max_y)
    -- will spawn the actors ramdombly alogn the 
    -- screen space, the screen space has to be distretized
    -- in a small but relative space
    for i = 1, self.number_of_instances, 1 do
        math.randomseed(self.seed * i)
        local new_actor = actor_class
        
        local pos_x, pos_y = self:get_random_position(min_x, max_x, min_y, max_y)
        local vel_x, vel_y = self:get_random_velocity()
        new_actor:set_position(pos_x, pos_y)
        new_actor:set_velocity(vel_x, vel_y)
        self.actor_array[1] = new_actor
    end
end

function Spawner:get_random_position(min_x, max_x, min_y, max_y)
    local pos_x = math.random(min_x, max_x)
    local pos_y = math.random(min_y, max_y)
    return pos_x, pos_y
end

function Spawner:get_random_velocity()
    local vel_x = math.random(-self.velocity_limit, self.velocity_limit)
    local vel_y = math.random(-self.velocity_limit, self.velocity_limit)
    return vel_x, vel_y
end

function Spawner:update(dt)
    for _, actor in pairs(self.actor_array) do
        actor:update(dt)
      end
end

function Spawner:draw()
    for _, actor in pairs(self.actor_array) do
        actor:draw("rectangle")
      end
end