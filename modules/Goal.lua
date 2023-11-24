local goal = {}

function goal.create(position)
    goal.scr_image  = "assets/mock/game_target.png"
    goal.sprite     = love.graphics.newImage(goal.scr_image)
    goal.width      = goal.sprite:getWidth()
    goal.height     = goal.sprite:getHeight()
    goal.position   = position

    return goal
end

function goal.draw()
    love.graphics.draw(goal.sprite, goal.position.x, goal.position.y)
end

return goal