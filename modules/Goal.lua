
local Vector = require("modules/Vector")
local goal = {}

function goal.create(position)
    goal.scr_image  = "assets/mock/game_target.png"
    goal.sprite     = love.graphics.newImage(goal.scr_image)
    goal.width      = goal.sprite:getWidth()
    goal.height     = goal.sprite:getHeight()
    goal.position   = position
    goal.colision_x = Vector.new(position.x, position.x + goal.width)
    goal.center     = Vector.new(position.x + goal.width / 2, position.y + goal.height / 2)

    return goal
end

function goal.checkTuneInGoal(tune)
    local tune_limit_x = tune:getLimitX()
    local result_limit_x = goal.colision_x:isInLimit(tune_limit_x.x, tune_limit_x.y)
    if result_limit_x == 1 and goal.colision_x.y > tune_limit_x.x then
        return true
    end

    if result_limit_x == -1 and goal.colision_x.x < tune_limit_x.y then
        return true
    end

    return result_limit_x == 0
end

function goal.getHitType(tune)
    local distance_from_goal = tune.position:distance(goal.position)

    if distance_from_goal <= HitType.PERFECT.distance then
        return HitType.PERFECT
    elseif distance_from_goal <= HitType.WELL_DONE.distance then
        return HitType.WELL_DONE
    else
        return HitType.GOOD
    end
end

function goal.draw()
    love.graphics.draw(goal.sprite, goal.position.x, goal.position.y)
end

return goal