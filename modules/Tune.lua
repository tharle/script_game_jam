local Vector = require("modules.Vector")
local Tune = {}
Tune.__index = Tune

-- @param type (table:Vector): position initiel
-- @param time (number): dans quel temps la tune devrait être joué
function Tune.new(tune_type, time)
    local o = {}
    
    o.position = Vector.new(880, 20)
    o.velocity = 400
    o.direction = Vector:Left()
    o.type = tune_type
    o.time = time
    o.width = o.type.width
    o.height = o.type.height

    setmetatable(o, Tune)

    return o
end

function Tune:update(dt)
    local direction_velocity = self.direction:multiplication(self.velocity * dt)
    self.position = self.position:addtion(direction_velocity)
end

function Tune:getLimitX()
    return Vector.new(self.position.x, self.position.x + self.width)
end

function Tune:getCenter()
    return Vector.new(self.position.x + self.width / 2, self.position.y + self.height / 2)
end

function Tune:play()
    love.audio.play(self.type.sound)
end

function Tune:toString()
    return "Table:Tune("..self.type.key..")"
end


function Tune:draw()
    love.graphics.draw(self.type.sprite, self.position.x, self.position.y)
end


return Tune