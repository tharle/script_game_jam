local Vector = require("modules/Vector")
local tune = {}

-- @param type (table:Vector): position initiel
-- @param time (number): dans quel temps la tune devrait être joué
function tune.create(tune_type, time)
    tune.position = Vector.new(760, 0)
    tune.velocity = 10
    tune.direction = Vector:Left()
    tune.type = tune_type
    tune.time = time

    return clone(tune)
end

function tune.update(dt)
    local direction_velocity = tune.direction:multiplication(tune.velocity * dt)
    tune.position = tune.position:addtion(direction_velocity)
end

function tune.toString()
    return "Table:Tune("..tune.type.name..")"
end

function tune.draw()
    love.graphics.draw(tune.type.sprite, tune.position.x, tune.position.y)
end


return tune