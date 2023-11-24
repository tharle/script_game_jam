local Vector = require("modules/Vector")
local tune = {}

-- @param type (table:Vector): position initiel
-- @param time (number): dans quel temps la tune devrait être joué
function tune.create(tune_type, time)
    tune.position = Vector.create(880, 0)
    tune.velocity = 10
    tune.direction = Vector.Left()
    tune.type = tune_type
    tune.time = time

    return clone(tune)
end

function tune.update(dt)
end

function tune.draw()
end

function tune.get_image(tune_type)
end

return tune