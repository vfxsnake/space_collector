Vec2d = {}
Vec2d.__index = Vec2d
Vec2d.x = 0.0
Vec2d.y = 0.0


function Vec2d:new(instance)
    instance = instance or {}   -- create object if user does not provide one
    self.__index = self
    setmetatable(instance, self)
    return instance
end

function Vec2d:set_value(value_x, value_y)
    self.x = value_x
    self.y = value_y
end

function Vec2d:length()
    
    return math.sqrt(math.pow(self.x, 2) + math.pow(self.y, 2))
end

function Vec2d:normalized()
  local normalized_vector = self:new()
  local lenght = self:length()
  if lenght <= 0 then
    lenght = 0.001
  end 
  local normal_x = self.x/lenght
  local normal_y = self.y/lenght
  normalized_vector:set_value( normal_x, normal_y)
  return normalized_vector
end

function Vec2d:dot(vector_b)
    return self.x * vector_b.x + self.y * vector_b.y
end