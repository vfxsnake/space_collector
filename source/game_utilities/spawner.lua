require("source/game_objects/cargo_actor")
Spawner = {}
Spawner.__index = Spawner
Spawner.number_of_instances = 5
Spawner.seed = 0.5
Spawner.velocity_limit = 25
Spawner.min_stamina = 5.0
Spawner.max_stamina = 10.0
Spawner.min_stamina_consumpsion = 0.1
Spawner.max_stamina_consumpsion = 1.0
Spawner.actor_array = {}
Spawner.game_over = false

function Spawner:new(instance)
    instance = instance or {}   -- create object if user does not provide one
    self.__index = self
    setmetatable(instance, self)
    return instance
  end

function Spawner:spawn_actors(actor_class, min_x, max_x, min_y, max_y)
    -- will spawn the actors ramdombly alogn the 
    -- screen space, the screen space has to be distretized
    -- in a small but relative space
    for i = 1, self.number_of_instances, 1 do
        local new_actor = actor_class:new()
        math.randomseed(self.seed * i * love.timer.getTime())
        local pos_x, pos_y = self:get_random_position(min_x, max_x, min_y, max_y)
        local vel_x, vel_y = self:get_random_velocity()
        new_actor:set_position(pos_x, pos_y)
        new_actor:set_velocity(vel_x, vel_y)
        new_actor.stamina = self:get_random_stamina()
        new_actor.reasource_usage = self:get_random_stamina_compsuption()
        new_actor.rotation_speed = self.get_random_rotation_speed()
        local max_index = #new_actor.sprite_list
        local random_index = self.get_random_index(max_index)
        new_actor:set_sprite_texture(new_actor.sprite_list[random_index])

        table.insert(self.actor_array, new_actor)
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

function Spawner:get_random_stamina()
    return math.random(self.min_stamina, self.max_stamina)
end

function Spawner:get_random_stamina_compsuption()
    return math.random(self.min_stamina_consumpsion, self.max_stamina_consumpsion)
end

function Spawner.get_random_rotation_speed()
    return math.random(-1.5, 1.5)
end

function Spawner.get_random_index(max_index)
    return math.random(1,max_index)
end

function Spawner:update(dt, bounding_data)
    for index, actor in pairs(self.actor_array) do
        -- if cargo in player shape delete
        if actor:get_distance_square_to(bounding_data.x, bounding_data.y) <= math.pow(bounding_data.rad, 2) then
            table.remove(self.actor_array, index)
            goto skip_to_next
        end
        if actor:is_death() then
            self.game_over = true
        end
        actor:update(dt)
        ::skip_to_next::
    end
end

function Spawner:draw()
    for _, actor in pairs(self.actor_array) do
        actor:draw("rectangle")
      end
end
